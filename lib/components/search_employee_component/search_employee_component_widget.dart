import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_employee_component_model.dart';
export 'search_employee_component_model.dart';

class SearchEmployeeComponentWidget extends StatefulWidget {
  const SearchEmployeeComponentWidget({
    super.key,
    this.tableauUrlLink,
    required this.fromPage,
  });

  final String? tableauUrlLink;
  final String? fromPage;

  @override
  State<SearchEmployeeComponentWidget> createState() =>
      _SearchEmployeeComponentWidgetState();
}

class _SearchEmployeeComponentWidgetState
    extends State<SearchEmployeeComponentWidget> {
  late SearchEmployeeComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchEmployeeComponentModel());

    _model.employeeKeywordInputTextController ??= TextEditingController();
    _model.employeeKeywordInputFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
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
                            widget.fromPage == 'เป้า/ผลงาน'
                                ? 'ดูเป้า/ผลงานของพนักงานรายบุคคล'
                                : 'ดูยอดประกันพนักงานรายบุคคล',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
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
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.person_search_sharp,
                                color: Colors.black,
                                size: 29.0,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'ค้นหาพนักงาน:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: TextFormField(
                                controller:
                                    _model.employeeKeywordInputTextController,
                                focusNode: _model.employeeKeywordInputFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'ชื่อเล่น/สังกัด/รหัสพนักงาน',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Poppins',
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                                textAlign: TextAlign.start,
                                validator: _model
                                    .employeeKeywordInputTextControllerValidator
                                    .asValidator(context),
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
                                  if (!(_model.employeeKeywordInputTextController
                                              .text !=
                                          null &&
                                      _model.employeeKeywordInputTextController
                                              .text !=
                                          '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณากรอก ชื่อเล่น/สังกัด/รหัสพนักงาน ของพนักงานที่ต้องการจะค้นหา'),
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
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingSceneWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  _model.getEmployeeSearched =
                                      await GetEmployeeIdFromNicknameAPICall
                                          .call(
                                    token: FFAppState().accessToken,
                                    searchName: _model
                                        .employeeKeywordInputTextController
                                        .text,
                                    apiUrl: FFAppState().apiURLLocalState,
                                  );
                                  _shouldSetState = true;
                                  if (!(((_model.getEmployeeSearched
                                                  ?.statusCode ??
                                              200) ==
                                          200) &&
                                      (GetEmployeeIdFromNicknameAPICall
                                              .statusLayer2(
                                            (_model.getEmployeeSearched
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          200))) {
                                    if ((_model.getEmployeeSearched
                                                ?.statusCode ??
                                            200) ==
                                        200) {
                                      if (GetEmployeeIdFromNicknameAPICall
                                              .statusLayer2(
                                            (_model.getEmployeeSearched
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          404) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    functions.showMatNameInList(
                                                        GetEmployeeIdFromNicknameAPICall
                                                            .detailMessage(
                                                          (_model.getEmployeeSearched
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList(),
                                                        0)!),
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
                                                    'พบข้อผิดพลาดLayer2 (${GetEmployeeIdFromNicknameAPICall.statusLayer2(
                                                  (_model.getEmployeeSearched
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
                                                  'พบข้อผิดพลาดConnection (${(_model.getEmployeeSearched?.statusCode ?? 200).toString()})'),
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
                                  Navigator.pop(context);
                                  if (_shouldSetState) setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (((_model.getEmployeeSearched?.statusCode ?? 200) ==
                              200) &&
                          (GetEmployeeIdFromNicknameAPICall.statusLayer2(
                                (_model.getEmployeeSearched?.jsonBody ?? ''),
                              ) ==
                              200))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
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
                                  'เลือกพนักงาน:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.dropDownValue ??= '',
                                  ),
                                  options: List<String>.from(
                                      GetEmployeeIdFromNicknameAPICall
                                          .employeeID(
                                    (_model.getEmployeeSearched?.jsonBody ??
                                        ''),
                                  )!),
                                  optionLabels:
                                      functions.createEmployeeDropdown(
                                          GetEmployeeIdFromNicknameAPICall
                                              .mapNickname(
                                            (_model.getEmployeeSearched
                                                    ?.jsonBody ??
                                                ''),
                                          )?.toList(),
                                          GetEmployeeIdFromNicknameAPICall
                                              .branch(
                                            (_model.getEmployeeSearched
                                                    ?.jsonBody ??
                                                ''),
                                          )?.toList()),
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue = val),
                                  width: 180.0,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'พนักงาน...',
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
                    ],
                  ),
                  if (_model.dropDownValue != null &&
                      _model.dropDownValue != '')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
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
                                        'กรุณาเลือกพนักงานที่ต้องการจะดูยอดประกันก่อน'),
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
                            return;
                          }
                          if (widget.fromPage == 'เป้า/ผลงาน') {
                            context.goNamed(
                              'IBSReport',
                              queryParameters: {
                                'employeeId': serializeParam(
                                  _model.dropDownValue,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );

                            return;
                          }
                          await actions.openTableauBrowser(
                            FFAppState().accessToken,
                            '${widget.tableauUrlLink}${_model.dropDownValue}/EmployeeInsurancePerformance/Emp_Sales',
                            FFAppState().isOpenAndroidTableauBrowser,
                          );
                        },
                        text: widget.fromPage == 'เป้า/ผลงาน'
                            ? 'ดูเป้า/ผลงาน'
                            : 'ดูยอดประกัน',
                        options: FFButtonOptions(
                          width: 270.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF24D200),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
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
    );
  }
}
