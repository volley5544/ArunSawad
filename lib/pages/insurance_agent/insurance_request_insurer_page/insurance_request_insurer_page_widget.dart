import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_request_insurer_page_model.dart';
export 'insurance_request_insurer_page_model.dart';

class InsuranceRequestInsurerPageWidget extends StatefulWidget {
  const InsuranceRequestInsurerPageWidget({super.key});

  @override
  State<InsuranceRequestInsurerPageWidget> createState() =>
      _InsuranceRequestInsurerPageWidgetState();
}

class _InsuranceRequestInsurerPageWidgetState
    extends State<InsuranceRequestInsurerPageWidget> {
  late InsuranceRequestInsurerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceRequestInsurerPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'InsuranceRequestInsurerPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
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

      if (FFAppState().fromPage == 'ListPage') {
        setState(() {
          _model.radioButtonValueController?.value =
              FFAppState().insuranceBasicCoverTypeName;
        });
        setState(() {
          _model.choiceChipsValueController?.value = [
            (FFAppState().insuranceBasicGarageName == 'ซ่อมอู่'
                ? 'ซ่อมอู่    '
                : 'ซ่อมห้าง')
          ];
        });
        setState(() {
          _model.checkboxValue = (FFAppState().insuranceBasicActFlag == '-'
              ? false
              : (FFAppState().insuranceBasicActFlag == '0' ? false : true));
        });
        setState(() {
          _model.sumInsuredInputTextController?.text =
              (FFAppState().insuranceBasicSumInsured == '-'
                  ? ''
                  : functions.convertDoubleTextToIntText(
                      FFAppState().insuranceBasicSumInsured)!);
          _model.sumInsuredInputTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.sumInsuredInputTextController!.text.length);
        });
        setState(() {
          _model.trailerSumInsuredInputTextController?.text =
              (FFAppState().insuranceBasicTrailerSumInsured == '-'
                  ? ''
                  : functions.convertDoubleTextToIntText(
                      FFAppState().insuranceBasicTrailerSumInsured)!);
          _model.trailerSumInsuredInputTextController?.selection =
              TextSelection.collapsed(
                  offset:
                      _model.trailerSumInsuredInputTextController!.text.length);
        });
        setState(() {
          _model.checkboxGroupValueController?.value =
              functions.generateSelectedInsurerList(
                  FFAppState().insuranceBasicInsurerListNameList.toList(),
                  FFAppState().insuranceBasicInsurerFullNameList.toList(),
                  FFAppState().insuranceBasicInsurerFullNameOutput.toList())!;
        });
      }
      Navigator.pop(context);
    });

    _model.sumInsuredInputTextController ??= TextEditingController();
    _model.sumInsuredInputFocusNode ??= FocusNode();

    _model.trailerSumInsuredInputTextController ??= TextEditingController();
    _model.trailerSumInsuredInputFocusNode ??= FocusNode();

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
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
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
                  color: Color(0xFBFFFFFF),
                  size: 30.0,
                ),
              ),
              title: Text(
                'ทำเรื่องขอประกันนอกเรท  (2/3)\nข้อมูลประเภทประกัน',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              toolbarHeight: 70.0,
              elevation: 10.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'ประเภทประกันที่ลูกค้าต้องการ  : ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              )),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'กรุณาเลือก',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 15.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FlutterFlowRadioButton(
                              options: FFAppState()
                                  .insuranceBasicCoverTypeNameList
                                  .toList(),
                              onChanged: (val) => setState(() {}),
                              controller: _model.radioButtonValueController ??=
                                  FormFieldController<String>(null),
                              optionHeight: 32.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.vertical,
                              radioButtonColor:
                                  FlutterFlowTheme.of(context).primary,
                              inactiveRadioButtonColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              toggleable: false,
                              horizontalAlignment: WrapAlignment.start,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 15.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData(
                                      'ซ่อมอู่    ', Icons.garage_outlined),
                                  ChipData('ซ่อมห้าง', Icons.warehouse_sharp)
                                ],
                                onChanged: (val) => setState(() =>
                                    _model.choiceChipsValue = val?.firstOrNull),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
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
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).grayIcon,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        letterSpacing: 0.0,
                                      ),
                                  iconColor: Color(0xFFE0E3E7),
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 12.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  ['ซ่อมอู่    '],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 5.0, 15.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'ขอเบี้ย พรบ.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.standard,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                unselectedWidgetColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              child: Checkbox(
                                value: _model.checkboxValue ??= true,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.checkboxValue = newValue!);
                                },
                                side: BorderSide(
                                  width: 2,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                checkColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 5.0, 15.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              FFAppState().vehicleTypeDropdown !=
                                      'รถบรรทุก หัวลาก หางพ่วง'
                                  ? 'ทุนประกันที่ต้องการ (บาท) :'
                                  : 'ทุนประกันหัวลากที่ต้องการ (บาท) :',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 5.0, 15.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: TextFormField(
                                  controller:
                                      _model.sumInsuredInputTextController,
                                  focusNode: _model.sumInsuredInputFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.sumInsuredInputTextController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'กรุณากรอก...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F5F5),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 24.0, 24.0),
                                    suffixIcon: _model
                                            .sumInsuredInputTextController!
                                            .text
                                            .isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model
                                                  .sumInsuredInputTextController
                                                  ?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFF757575),
                                              size: 22.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        lineHeight: 1.0,
                                      ),
                                  validator: _model
                                      .sumInsuredInputTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if ((FFAppState().insuranceBasicTruckPart ==
                              'หัวลาก + หางพ่วง') &&
                          (FFAppState().vehicleTypeDropdown ==
                              'รถบรรทุก หัวลาก หางพ่วง'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 5.0, 15.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'ทุนประกันหางพ่วงที่ต้องการ (บาท) :',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      if ((FFAppState().insuranceBasicTruckPart ==
                              'หัวลาก + หางพ่วง') &&
                          (FFAppState().vehicleTypeDropdown ==
                              'รถบรรทุก หัวลาก หางพ่วง'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 5.0, 15.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: TextFormField(
                                    controller: _model
                                        .trailerSumInsuredInputTextController,
                                    focusNode:
                                        _model.trailerSumInsuredInputFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.trailerSumInsuredInputTextController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'กรุณากรอก...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF5F5F5),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 24.0, 24.0),
                                      suffixIcon: _model
                                              .trailerSumInsuredInputTextController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model
                                                    .trailerSumInsuredInputTextController
                                                    ?.clear();
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Color(0xFF757575),
                                                size: 22.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          lineHeight: 1.0,
                                        ),
                                    validator: _model
                                        .trailerSumInsuredInputTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'บริษัทที่อยากจะได้ใบเสนอราคา  : ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              )),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'กรุณาเลือก',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 15.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FlutterFlowCheckboxGroup(
                                options: FFAppState()
                                    .insuranceBasicInsurerListNameRandomList
                                    .toList(),
                                onChanged: (val) async {
                                  setState(
                                      () => _model.checkboxGroupValues = val);
                                  FFAppState().insurancePackageInsurer = true;
                                  setState(() {});
                                  if (_model.checkboxGroupValues!.length > 5) {
                                    setState(() {
                                      _model.checkboxGroupValueController
                                              ?.value =
                                          _model.checkboxGroupValues!
                                              .take(5)
                                              .toList();
                                    });
                                  }
                                },
                                controller:
                                    _model.checkboxGroupValueController ??=
                                        FormFieldController<List<String>>(
                                  [],
                                ),
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                checkColor: Colors.white,
                                checkboxBorderColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                                checkboxBorderRadius:
                                    BorderRadius.circular(4.0),
                                initialized: _model.checkboxGroupValues != null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (!(_model.radioButtonValue != null &&
                                          _model.radioButtonValue != '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกประเภทประกัน',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor: Color(0xB2000000),
                                          ),
                                        );
                                        return;
                                      }
                                      if (FFAppState()
                                          .insurancePackageInsurer) {
                                        if (_model
                                                .checkboxGroupValues!.length <=
                                            0) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'กรุณาเลือกบริษัทประกัน',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                          return;
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกบริษัทประกัน',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor: Color(0xB2000000),
                                          ),
                                        );
                                        return;
                                      }

                                      if (!(_model.sumInsuredInputTextController
                                                  .text ==
                                              null ||
                                          _model.sumInsuredInputTextController
                                                  .text ==
                                              '')) {
                                        if (!functions.checkIsIntValue(_model
                                            .sumInsuredInputTextController
                                            .text)!) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                FFAppState().vehicleTypeDropdown ==
                                                        'รถบรรทุก หัวลาก หางพ่วง'
                                                    ? 'ทุนประกันหัวลากที่ต้องการ จะต้องเป็นจำนวนเต็มบาท'
                                                    : 'ทุนประกันที่ต้องการ จะต้องเป็นจำนวนเต็มบาท',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                          return;
                                        }
                                      }
                                      if (!(_model.trailerSumInsuredInputTextController
                                                  .text ==
                                              null ||
                                          _model.trailerSumInsuredInputTextController
                                                  .text ==
                                              '')) {
                                        if (!functions.checkIsIntValue(_model
                                            .trailerSumInsuredInputTextController
                                            .text)!) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'ทุนประกันหางพ่วงที่ต้องการ จะต้องเป็นจำนวนเต็มบาท',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                          return;
                                        }
                                      }
                                      FFAppState().insuranceBasicCoverTypeCode =
                                          functions.searchMapValueFrom2List(
                                              FFAppState()
                                                  .insuranceBasicCoverTypeCodeList
                                                  .toList(),
                                              FFAppState()
                                                  .insuranceBasicCoverTypeNameList
                                                  .toList(),
                                              _model.radioButtonValue);
                                      setState(() {});
                                      FFAppState().insuranceBasicCoverTypeId =
                                          functions.searchMapValueFrom2List(
                                              FFAppState()
                                                  .insuranceBasicCoverTypeIdList
                                                  .toList(),
                                              FFAppState()
                                                  .insuranceBasicCoverTypeNameList
                                                  .toList(),
                                              _model.radioButtonValue);
                                      setState(() {});
                                      FFAppState().insuranceBasicCoverTypeName =
                                          _model.radioButtonValue!;
                                      setState(() {});
                                      FFAppState().insuranceBasicGarageId =
                                          functions.returnStringWithNoSpace(
                                                      _model
                                                          .choiceChipsValue) ==
                                                  'ซ่อมห้าง'
                                              ? '1'
                                              : '2';
                                      setState(() {});
                                      FFAppState().insuranceBasicGarageName =
                                          functions.returnStringWithNoSpace(
                                              _model.choiceChipsValue);
                                      setState(() {});
                                      FFAppState()
                                              .insuranceBasicInsurerIdOutput =
                                          functions
                                              .returnInsuranceBasicInsurerList(
                                                  FFAppState()
                                                      .insuranceBasicInsurerIdList
                                                      .toList(),
                                                  FFAppState()
                                                      .insuranceBasicInsurerListNameList
                                                      .toList(),
                                                  _model.checkboxGroupValues
                                                      ?.toList())!
                                              .toList()
                                              .cast<String>();
                                      setState(() {});
                                      FFAppState()
                                              .insuranceBasicInsurerCodeOutput =
                                          functions
                                              .returnInsuranceBasicInsurerList(
                                                  FFAppState()
                                                      .insuranceBasicInsurerCodeList
                                                      .toList(),
                                                  FFAppState()
                                                      .insuranceBasicInsurerListNameList
                                                      .toList(),
                                                  _model.checkboxGroupValues
                                                      ?.toList())!
                                              .toList()
                                              .cast<String>();
                                      setState(() {});
                                      FFAppState()
                                              .insuranceBasicInsurerShortNameOutput =
                                          functions
                                              .returnInsuranceBasicInsurerList(
                                                  FFAppState()
                                                      .insuranceBasicInsurerShortNameList
                                                      .toList(),
                                                  FFAppState()
                                                      .insuranceBasicInsurerListNameList
                                                      .toList(),
                                                  _model.checkboxGroupValues
                                                      ?.toList())!
                                              .toList()
                                              .cast<String>();
                                      setState(() {});
                                      FFAppState()
                                              .insuranceBasicInsurerFullNameOutput =
                                          functions
                                              .returnInsuranceBasicInsurerList(
                                                  FFAppState()
                                                      .insuranceBasicInsurerFullNameList
                                                      .toList(),
                                                  FFAppState()
                                                      .insuranceBasicInsurerListNameList
                                                      .toList(),
                                                  _model.checkboxGroupValues
                                                      ?.toList())!
                                              .toList()
                                              .cast<String>();
                                      setState(() {});
                                      FFAppState().insuranceBasicActFlag =
                                          _model.checkboxValue! ? '1' : '0';
                                      setState(() {});
                                      FFAppState().insuranceBasicSumInsured =
                                          _model.sumInsuredInputTextController
                                                          .text !=
                                                      null &&
                                                  _model.sumInsuredInputTextController
                                                          .text !=
                                                      ''
                                              ? _model
                                                  .sumInsuredInputTextController
                                                  .text
                                              : '';
                                      setState(() {});
                                      FFAppState()
                                              .insuranceBasicTrailerSumInsured =
                                          _model.trailerSumInsuredInputTextController
                                                          .text !=
                                                      null &&
                                                  _model.trailerSumInsuredInputTextController
                                                          .text !=
                                                      ''
                                              ? _model
                                                  .trailerSumInsuredInputTextController
                                                  .text
                                              : '';
                                      setState(() {});

                                      context.pushNamed(
                                          'InsuranceRequestImagePage');
                                    },
                                    text: 'ถัดไป',
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      size: 18.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 60.0,
                                      padding: EdgeInsets.all(0.0),
                                      iconPadding: EdgeInsets.all(0.0),
                                      color: Color(0xFF0066FF),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
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
                ].addToEnd(SizedBox(height: 75.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
