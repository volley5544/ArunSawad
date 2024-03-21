import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_request_basic_page_model.dart';
export 'insurance_request_basic_page_model.dart';

class InsuranceRequestBasicPageWidget extends StatefulWidget {
  const InsuranceRequestBasicPageWidget({super.key});

  @override
  State<InsuranceRequestBasicPageWidget> createState() =>
      _InsuranceRequestBasicPageWidgetState();
}

class _InsuranceRequestBasicPageWidgetState
    extends State<InsuranceRequestBasicPageWidget> {
  late InsuranceRequestBasicPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceRequestBasicPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'InsuranceRequestBasicPage'});
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
                child: Container(
                  height: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      if (FFAppState().fromPage == 'ListPage') {
        setState(() {
          _model.operationChoiceChipsValueController?.value = [
            (FFAppState().operationChoiceChips == '0'
                ? 'งานใหม่          '
                : 'งานต่ออายุ      ')
          ];
        });
        setState(() {
          _model.customerTypeChoiceChipsValueController?.value = [
            (FFAppState().customerTypeChoiceChips == 'บุคคลธรรมดา'
                ? 'บุคคลธรรมดา'
                : 'นิติบุคคล         ')
          ];
        });
        setState(() {
          _model.insuranceLicenseNoInputController?.text =
              FFAppState().insuranceBasicOldLicenseNo;
        });
        setState(() {
          _model.vehicleTypeDropDownValueController?.value =
              FFAppState().vehicleTypeDropdown;
        });
        setState(() {
          _model.customerMemberchipChoiceChipsValueController?.value = [
            (FFAppState().insuranceBasicMemberType == '-'
                ? 'ลูกค้าสินเชื่อ'
                : (FFAppState().insuranceBasicMemberType == 'ลูกค้าสินเชื่อ'
                    ? 'ลูกค้าสินเชื่อ'
                    : 'ลูกค้านอก      '))
          ];
        });
        setState(() {
          _model.truckPartRadioButtonValueController?.value =
              (FFAppState().insuranceBasicTruckPart == '-'
                  ? 'เฉพาะหัวลาก'
                  : (FFAppState().insuranceBasicTruckPart == '0'
                      ? 'เฉพาะหัวลาก'
                      : 'หัวลาก + หางพ่วง'));
        });
        setState(() {
          _model.boxCheckboxValue = FFAppState().isEquipedMetalBox;
        });
        setState(() {
          _model.coopCheckboxValue = FFAppState().insuranceBasicCoop;
        });
        setState(() {
          _model.boxTypeChoiceChipValueController?.value = [
            (FFAppState().insuranceBasicPickupBoxType == '-'
                ? 'ตู้แห้ง'
                : (FFAppState().insuranceBasicPickupBoxType == 'ตู้แห้ง'
                    ? 'ตู้แห้ง'
                    : 'ตู้เย็น'))
          ];
        });
        setState(() {
          _model.freezeBoxPriceInputController?.text =
              functions.convertDoubleTextToIntText(
                  FFAppState().insuranceBasicPickupBoxPrice)!;
        });
        await Future.delayed(const Duration(milliseconds: 600));
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'คัดลอกข้อมูลขอประกันสำเร็จ ${FFAppState().insuranceBasicBrandName} ${FFAppState().insuranceBasicModelName}'),
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
        setState(() {
          _model.brandInputController?.text =
              FFAppState().insuranceBasicBrandName;
        });
        setState(() {
          _model.modelInputController?.text =
              FFAppState().insuranceBasicModelName;
        });
        setState(() {
          _model.truckCurrentPriceInputController?.text =
              (FFAppState().insuranceBasicTruckCurrentPrice == '-'
                  ? ''
                  : functions.convertDoubleTextToIntText(
                      FFAppState().insuranceBasicTruckCurrentPrice)!);
        });
        setState(() {
          _model.plateInputController?.text =
              FFAppState().insuranceBasicPlateNo;
        });
        setState(() {
          _model.plateAdditionalInputController?.text =
              (FFAppState().insuranceBasicPlateAdditional == '-'
                  ? ''
                  : FFAppState().insuranceBasicPlateAdditional);
        });
        setState(() {
          _model.yearDropDownValueController?.value =
              FFAppState().insuranceBasicYear;
        });
        setState(() {
          _model.provinceDropDownValueController?.value =
              FFAppState().insuranceBasicProvinceName;
        });
        setState(() {
          _model.useTypeDropDownValueController?.value =
              FFAppState().insuranceBasicVehicleUsedTypeCode;
        });
        setState(() {
          _model.logistPoposeInputController?.text =
              (FFAppState().insuranceBasicCarryPurpose == '-'
                  ? ''
                  : FFAppState().insuranceBasicCarryPurpose);
        });
        setState(() {
          _model.carModifyCheckboxValue = FFAppState().insuranceBasicCarModify;
        });
        setState(() {
          _model.accessoryProtectedInputController?.text =
              (FFAppState().insuranceBasicAccessoryProtected == '-'
                  ? ''
                  : FFAppState().insuranceBasicAccessoryProtected);
        });
        setState(() {
          _model.nameInputController?.text = FFAppState().insuranceBasicCusName;
        });
        setState(() {
          _model.lastnameInputController?.text =
              FFAppState().insuranceBasicCusLastname;
        });
        setState(() {
          _model.phoneInputController?.text =
              FFAppState().insuranceBasicCusPhone;
        });
        setState(() {
          _model.idInputController?.text =
              (FFAppState().insuranceBasicIdCardNo == '-'
                  ? ''
                  : FFAppState().insuranceBasicIdCardNo);
        });
        setState(() {
          _model.remarkInputController?.text =
              (FFAppState().insuranceBasicRemark == '-'
                  ? ''
                  : FFAppState().insuranceBasicRemark);
        });
      }
      Navigator.pop(context);
    });

    _model.insuranceLicenseNoInputController ??= TextEditingController();
    _model.insuranceLicenseNoInputFocusNode ??= FocusNode();

    _model.freezeBoxPriceInputController ??= TextEditingController();
    _model.freezeBoxPriceInputFocusNode ??= FocusNode();

    _model.brandInputController ??= TextEditingController();

    _model.modelInputController ??= TextEditingController();

    _model.truckCurrentPriceInputController ??= TextEditingController();
    _model.truckCurrentPriceInputFocusNode ??= FocusNode();

    _model.plateInputController ??= TextEditingController();
    _model.plateInputFocusNode ??= FocusNode();

    _model.plateAdditionalInputController ??= TextEditingController();
    _model.plateAdditionalInputFocusNode ??= FocusNode();

    _model.logistPoposeInputController ??= TextEditingController();
    _model.logistPoposeInputFocusNode ??= FocusNode();

    _model.accessoryProtectedInputController ??= TextEditingController();
    _model.accessoryProtectedInputFocusNode ??= FocusNode();

    _model.nameInputController ??= TextEditingController();
    _model.nameInputFocusNode ??= FocusNode();

    _model.lastnameInputController ??= TextEditingController();
    _model.lastnameInputFocusNode ??= FocusNode();

    _model.phoneInputController ??= TextEditingController();
    _model.phoneInputFocusNode ??= FocusNode();

    _model.idInputController ??= TextEditingController();
    _model.idInputFocusNode ??= FocusNode();

    _model.remarkInputController ??= TextEditingController();
    _model.remarkInputFocusNode ??= FocusNode();

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
                  setState(() {
                    _model.vehicleTypeDropDownValueController?.reset();
                  });
                  if (FFAppState().fromPage == 'ListPage') {
                    context.goNamed('InsuranceRequestListPage');

                    return;
                  }

                  context.goNamed('InsuranceRequestDashboardPage');
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFBFFFFFF),
                  size: 30.0,
                ),
              ),
              title: Text(
                'ทำเรื่องขอประกันนอกเรท (1/3)\nข้อมูลเบื้องต้น',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 18.0,
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
                            20.0, 20.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData('งานใหม่          ',
                                      Icons.document_scanner_sharp),
                                  ChipData(
                                      'งานต่ออายุ      ', Icons.more_time_sharp)
                                ],
                                onChanged: (val) async {
                                  setState(() =>
                                      _model.operationChoiceChipsValue =
                                          val?.firstOrNull);
                                  setState(() {
                                    FFAppState().insuranceOperationChoiceChips =
                                        functions.returnStringWithNoSpace(
                                            _model.operationChoiceChipsValue);
                                  });
                                },
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
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
                                      ),
                                  iconColor: Color(0xFFE0E3E7),
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 12.0,
                                multiselect: false,
                                initialized:
                                    _model.operationChoiceChipsValue != null,
                                alignment: WrapAlignment.start,
                                controller: _model
                                        .operationChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                                  ['งานใหม่          '],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData('บุคคลธรรมดา', Icons.person_2),
                                  ChipData('นิติบุคคล         ',
                                      Icons.maps_home_work_outlined)
                                ],
                                onChanged: (val) async {
                                  setState(() =>
                                      _model.customerTypeChoiceChipsValue =
                                          val?.firstOrNull);
                                  setState(() {
                                    FFAppState()
                                            .insuranceCustomerTypeChoiceChips =
                                        functions.returnStringWithNoSpace(_model
                                            .customerTypeChoiceChipsValue);
                                  });
                                },
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
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
                                      ),
                                  iconColor: Color(0xFFE0E3E7),
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 12.0,
                                multiselect: false,
                                initialized:
                                    _model.customerTypeChoiceChipsValue != null,
                                alignment: WrapAlignment.start,
                                controller: _model
                                        .customerTypeChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                                  ['บุคคลธรรมดา'],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (functions.returnStringWithNoSpace(
                              FFAppState().insuranceOperationChoiceChips) ==
                          'งานต่ออายุ')
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
                                  'เลขกรมธรรม์เดิม  : ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                      ),
                                )),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.35, -0.09),
                                child: SelectionArea(
                                    child: Text(
                                  'กรุณากรอก',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 15.0,
                                      ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      if (functions.returnStringWithNoSpace(
                              FFAppState().insuranceOperationChoiceChips) ==
                          'งานต่ออายุ')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 15.0, 5.0),
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
                                        .insuranceLicenseNoInputController,
                                    focusNode:
                                        _model.insuranceLicenseNoInputFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.insuranceLicenseNoInputController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'กรุณากรอก...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
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
                                              .insuranceLicenseNoInputController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model
                                                    .insuranceLicenseNoInputController
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
                                          lineHeight: 1.0,
                                        ),
                                    validator: _model
                                        .insuranceLicenseNoInputControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (functions.returnStringWithNoSpace(
                              FFAppState().insuranceOperationChoiceChips) ==
                          'งานต่ออายุ')
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
                                  'วันหมดอายุกรมธรรม์เดิม  : ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
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
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 15.0,
                                      ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      if (functions.returnStringWithNoSpace(
                              FFAppState().insuranceOperationChoiceChips) ==
                          'งานต่ออายุ')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 15.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (kIsWeb) {
                                      final _datePickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2050),
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
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: () => LocaleType.en,
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                'yMMMd',
                                                _model.datePicked,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              'กรุณาเลือก...',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                          ),
                                          Icon(
                                            Icons.more_time,
                                            color: Color(0xFF757575),
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'ประเภทรถ  : ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
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
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 15.0, 5.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          constraints: BoxConstraints(
                            maxWidth: double.infinity,
                            maxHeight: double.infinity,
                          ),
                          decoration: BoxDecoration(),
                          child:
                              // บังคับให้เลือก
                              FlutterFlowDropDown<String>(
                            controller:
                                _model.vehicleTypeDropDownValueController ??=
                                    FormFieldController<String>(null),
                            options: [
                              'รถเก๋ง',
                              'รถตู้',
                              'รถกระบะ',
                              'รถบรรทุก หัวลาก หางพ่วง'
                            ],
                            onChanged: (val) async {
                              setState(
                                  () => _model.vehicleTypeDropDownValue = val);
                              setState(() {
                                FFAppState().insuranceVehicleTypeDropDown =
                                    _model.vehicleTypeDropDownValue!;
                              });
                            },
                            width: 90.0,
                            height: double.infinity,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            hintText: 'กรุณาเลือก...',
                            fillColor: Colors.white,
                            elevation: 2.0,
                            borderColor: Color(0xFFBDBDBD),
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsets.all(20.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ),
                      if (FFAppState().insuranceVehicleTypeDropDown ==
                          'รถบรรทุก หัวลาก หางพ่วง')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 10.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: FlutterFlowChoiceChips(
                                  options: [
                                    ChipData('ลูกค้าสินเชื่อ',
                                        Icons.card_membership_outlined),
                                    ChipData(
                                        'ลูกค้านอก      ', Icons.person_add_alt)
                                  ],
                                  onChanged: (val) => setState(() => _model
                                          .customerMemberchipChoiceChipsValue =
                                      val?.firstOrNull),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
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
                                        ),
                                    iconColor: Color(0xFFE0E3E7),
                                    iconSize: 18.0,
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  chipSpacing: 12.0,
                                  rowSpacing: 12.0,
                                  multiselect: false,
                                  initialized: _model
                                          .customerMemberchipChoiceChipsValue !=
                                      null,
                                  alignment: WrapAlignment.start,
                                  controller: _model
                                          .customerMemberchipChoiceChipsValueController ??=
                                      FormFieldController<List<String>>(
                                    ['ลูกค้าสินเชื่อ'],
                                  ),
                                  wrapped: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (valueOrDefault<bool>(
                        FFAppState().insuranceVehicleTypeDropDown ==
                            'รถบรรทุก หัวลาก หางพ่วง',
                        false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FlutterFlowRadioButton(
                                options: ['เฉพาะหัวลาก', 'หัวลาก + หางพ่วง']
                                    .toList(),
                                onChanged: (val) => setState(() {}),
                                controller: _model
                                        .truckPartRadioButtonValueController ??=
                                    FormFieldController<String>('เฉพาะหัวลาก'),
                                optionHeight: 32.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
                                    ),
                                selectedTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
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
                      if (valueOrDefault<bool>(
                        FFAppState().insuranceVehicleTypeDropDown == 'รถกระบะ',
                        false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'ติดตู้เหล็กหรือไม่?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.boxCheckboxValue ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.boxCheckboxValue = newValue!);
                                      if (newValue!) {
                                        setState(() {
                                          FFAppState()
                                              .insuranceBoxCheckbokValue = true;
                                        });
                                      } else {
                                        setState(() {
                                          FFAppState()
                                                  .insuranceBoxCheckbokValue =
                                              false;
                                        });
                                      }
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (valueOrDefault<bool>(
                        FFAppState().insuranceBoxCheckbokValue &&
                            valueOrDefault<bool>(
                              FFAppState().insuranceVehicleTypeDropDown ==
                                  'รถกระบะ',
                              false,
                            ),
                        false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 10.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'ใช้วิ่งร่วมกับบริษัทขนส่งเอกชนหรือไม่?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.coopCheckboxValue ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.coopCheckboxValue = newValue!);
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (FFAppState().insuranceBoxCheckbokValue &&
                          (FFAppState().insuranceVehicleTypeDropDown ==
                              'รถกระบะ'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 10.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: FlutterFlowChoiceChips(
                                  options: [
                                    ChipData('ตู้แห้ง',
                                        Icons.check_box_outline_blank),
                                    ChipData(
                                        'ตู้เย็น', FontAwesomeIcons.snowflake)
                                  ],
                                  onChanged: (val) async {
                                    setState(() =>
                                        _model.boxTypeChoiceChipValue =
                                            val?.firstOrNull);
                                    setState(() {
                                      FFAppState().insuranceBoxTypeChoiceChip =
                                          functions.returnStringWithNoSpace(
                                              _model.boxTypeChoiceChipValue);
                                    });
                                  },
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
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
                                        ),
                                    iconColor: Color(0xFFE0E3E7),
                                    iconSize: 18.0,
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  chipSpacing: 12.0,
                                  rowSpacing: 12.0,
                                  multiselect: false,
                                  initialized:
                                      _model.boxTypeChoiceChipValue != null,
                                  alignment: WrapAlignment.start,
                                  controller: _model
                                          .boxTypeChoiceChipValueController ??=
                                      FormFieldController<List<String>>(
                                    ['ตู้แห้ง'],
                                  ),
                                  wrapped: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (FFAppState().insuranceBoxCheckbokValue &&
                          (FFAppState().insuranceVehicleTypeDropDown ==
                              'รถกระบะ') &&
                          (FFAppState().insuranceBoxTypeChoiceChip ==
                              'ตู้เย็น'))
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
                                  'ราคาตู้ + เครื่องทำความเย็น  : ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                      ),
                                )),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.35, -0.09),
                                child: SelectionArea(
                                    child: Text(
                                  'กรุณากรอก',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 15.0,
                                      ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      if (FFAppState().insuranceBoxCheckbokValue &&
                          (FFAppState().insuranceVehicleTypeDropDown ==
                              'รถกระบะ') &&
                          (FFAppState().insuranceBoxTypeChoiceChip ==
                              'ตู้เย็น'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 15.0, 5.0),
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
                                        _model.freezeBoxPriceInputController,
                                    focusNode:
                                        _model.freezeBoxPriceInputFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.freezeBoxPriceInputController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'กรุณากรอก...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
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
                                              .freezeBoxPriceInputController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model
                                                    .freezeBoxPriceInputController
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
                                          lineHeight: 1.0,
                                        ),
                                    validator: _model
                                        .freezeBoxPriceInputControllerValidator
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'ยี่ห้อรถ  : ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                    ),
                              )),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'กรุณากรอก',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 15.0,
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
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Autocomplete<String>(
                                  initialValue: TextEditingValue(),
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    return FFAppState()
                                        .insuranceBasicBrandNameList
                                        .where((option) {
                                      final lowercaseOption =
                                          option.toLowerCase();
                                      return lowercaseOption.contains(
                                          textEditingValue.text.toLowerCase());
                                    });
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return AutocompleteOptionsList(
                                      textFieldKey: _model.brandInputKey,
                                      textController:
                                          _model.brandInputController!,
                                      options: options.toList(),
                                      onSelected: onSelected,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                        .brandInputSelectedOption = selection);
                                    FocusScope.of(context).unfocus();
                                  },
                                  fieldViewBuilder: (
                                    context,
                                    textEditingController,
                                    focusNode,
                                    onEditingComplete,
                                  ) {
                                    _model.brandInputFocusNode = focusNode;

                                    _model.brandInputController =
                                        textEditingController;
                                    return TextFormField(
                                      key: _model.brandInputKey,
                                      controller: textEditingController,
                                      focusNode: focusNode,
                                      onEditingComplete: onEditingComplete,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.brandInputController',
                                        Duration(milliseconds: 1000),
                                        () async {
                                          setState(() {
                                            FFAppState().insuranceBasicModelNameList = functions
                                                .returnMappedListFrom2List(
                                                    FFAppState()
                                                        .insuranceBasicModelNameListOriginal
                                                        .toList(),
                                                    FFAppState()
                                                        .insuranceBasicModelBrandIdListOriginal
                                                        .toList(),
                                                    functions.searchMapValueFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandNameList
                                                            .toList(),
                                                        _model
                                                            .brandInputController
                                                            .text))
                                                .toList()
                                                .cast<String>();
                                          });
                                        },
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'กรุณากรอก...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
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
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
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
                                        suffixIcon: _model.brandInputController!
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.brandInputController
                                                      ?.clear();
                                                  setState(() {
                                                    FFAppState().insuranceBasicModelNameList = functions
                                                        .returnMappedListFrom2List(
                                                            FFAppState()
                                                                .insuranceBasicModelNameListOriginal
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicModelBrandIdListOriginal
                                                                .toList(),
                                                            functions.searchMapValueFrom2List(
                                                                FFAppState()
                                                                    .insuranceBasicBrandIdList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicBrandNameList
                                                                    .toList(),
                                                                _model
                                                                    .brandInputController
                                                                    .text))
                                                        .toList()
                                                        .cast<String>();
                                                  });
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
                                            lineHeight: 1.0,
                                          ),
                                      validator: _model
                                          .brandInputControllerValidator
                                          .asValidator(context),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'รุ่นรถ  : ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                    ),
                              )),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'กรุณากรอก',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 15.0,
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
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Autocomplete<String>(
                                  initialValue: TextEditingValue(),
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    return FFAppState()
                                        .insuranceBasicModelNameList
                                        .where((option) {
                                      final lowercaseOption =
                                          option.toLowerCase();
                                      return lowercaseOption.contains(
                                          textEditingValue.text.toLowerCase());
                                    });
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return AutocompleteOptionsList(
                                      textFieldKey: _model.modelInputKey,
                                      textController:
                                          _model.modelInputController!,
                                      options: options.toList(),
                                      onSelected: onSelected,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                        .modelInputSelectedOption = selection);
                                    FocusScope.of(context).unfocus();
                                  },
                                  fieldViewBuilder: (
                                    context,
                                    textEditingController,
                                    focusNode,
                                    onEditingComplete,
                                  ) {
                                    _model.modelInputFocusNode = focusNode;

                                    _model.modelInputController =
                                        textEditingController;
                                    return TextFormField(
                                      key: _model.modelInputKey,
                                      controller: textEditingController,
                                      focusNode: focusNode,
                                      onEditingComplete: onEditingComplete,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.modelInputController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'กรุณากรอก...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
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
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
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
                                        suffixIcon: _model.modelInputController!
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.modelInputController
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
                                            lineHeight: 1.0,
                                          ),
                                      validator: _model
                                          .modelInputControllerValidator
                                          .asValidator(context),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (FFAppState().insuranceVehicleTypeDropDown ==
                          'รถบรรทุก หัวลาก หางพ่วง')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 10.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.35, -0.09),
                                child: SelectionArea(
                                    child: Text(
                                  'ราคาซื้อขายปัจจุบัน :',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                      ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      if (FFAppState().insuranceVehicleTypeDropDown ==
                          'รถบรรทุก หัวลาก หางพ่วง')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 15.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: TextFormField(
                                    controller:
                                        _model.truckCurrentPriceInputController,
                                    focusNode:
                                        _model.truckCurrentPriceInputFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.truckCurrentPriceInputController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'กรุณากรอก...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
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
                                              .truckCurrentPriceInputController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model
                                                    .truckCurrentPriceInputController
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
                                          lineHeight: 1.0,
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .truckCurrentPriceInputControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (_model.vehicleTypeDropDownValue != null &&
                          _model.vehicleTypeDropDownValue != '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 10.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (FFAppState().insuranceVehicleTypeDropDown !=
                                  'รถบรรทุก หัวลาก หางพ่วง')
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'ทะเบียนรถ  : ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black600,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      TextSpan(
                                        text: 'ไม่ต้องใส่ขีด -',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                        ),
                                  ),
                                ),
                              if (FFAppState().insuranceVehicleTypeDropDown ==
                                  'รถบรรทุก หัวลาก หางพ่วง')
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'ทะเบียนหัวลาก  : ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black600,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      TextSpan(
                                        text: '* (เลขทะเบียนรถ เช่น 123456)',
                                        style: TextStyle(
                                          color: Color(0xFFC40000),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      if (_model.vehicleTypeDropDownValue != null &&
                          _model.vehicleTypeDropDownValue != '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 15.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // บังคับให้เลือก
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: TextFormField(
                                    controller: _model.plateInputController,
                                    focusNode: _model.plateInputFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.plateInputController',
                                      Duration(milliseconds: 2000),
                                      () async {},
                                    ),
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'เลขทะเบียนรถ ไม่ต้องใส่ขีด -',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
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
                                      suffixIcon: _model.plateInputController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.plateInputController
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
                                          color: Color(0xFF0A0A0A),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    validator: _model
                                        .plateInputControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if ((FFAppState().insuranceVehicleTypeDropDown ==
                              'รถบรรทุก หัวลาก หางพ่วง') &&
                          (_model.truckPartRadioButtonValue ==
                              'หัวลาก + หางพ่วง'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 10.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.35, -0.09),
                                child: SelectionArea(
                                    child: Text(
                                  'เลขทะเบียนหางพ่วง  : ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                      ),
                                )),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.35, -0.09),
                                child: SelectionArea(
                                    child: Text(
                                  'กรุณากรอก',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 15.0,
                                      ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      if ((FFAppState().insuranceVehicleTypeDropDown ==
                              'รถบรรทุก หัวลาก หางพ่วง') &&
                          (_model.truckPartRadioButtonValue ==
                              'หัวลาก + หางพ่วง'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 15.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // บังคับให้เลือก
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: TextFormField(
                                    controller:
                                        _model.plateAdditionalInputController,
                                    focusNode:
                                        _model.plateAdditionalInputFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.plateAdditionalInputController',
                                      Duration(milliseconds: 2000),
                                      () async {},
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'กรุณากรอก...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
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
                                              .plateAdditionalInputController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model
                                                    .plateAdditionalInputController
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
                                          color: Color(0xFF0A0A0A),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    validator: _model
                                        .plateAdditionalInputControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'ปีจดทะเบียน (พ.ศ.)  : ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
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
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 15.0, 5.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          constraints: BoxConstraints(
                            maxWidth: double.infinity,
                            maxHeight: double.infinity,
                          ),
                          decoration: BoxDecoration(),
                          child:
                              // บังคับให้เลือก
                              FlutterFlowDropDown<String>(
                            controller: _model.yearDropDownValueController ??=
                                FormFieldController<String>(
                              _model.yearDropDownValue ??= '',
                            ),
                            options: List<String>.from(
                                functions.ganerateYearList(1957, 2023)!),
                            optionLabels:
                                functions.ganerateYearList(2500, 2566)!,
                            onChanged: (val) =>
                                setState(() => _model.yearDropDownValue = val),
                            width: 90.0,
                            height: double.infinity,
                            searchHintTextStyle: GoogleFonts.getFont(
                              'Roboto',
                            ),
                            searchTextStyle:
                                FlutterFlowTheme.of(context).bodyMedium,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            hintText: 'กรุณาเลือก...',
                            searchHintText: 'พิมพ์ปี พ.ศ. ...',
                            fillColor: Colors.white,
                            elevation: 2.0,
                            borderColor: Color(0xFFBDBDBD),
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsets.all(0.0),
                            hidesUnderline: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'จังหวัดจดทะเบียน  : ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
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
                          children: [
                            // บังคับให้เลือก
                            Expanded(
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.provinceDropDownValueController ??=
                                        FormFieldController<String>(null),
                                options:
                                    FFAppState().insuranceBasicProvinceNameList,
                                onChanged: (val) => setState(
                                    () => _model.provinceDropDownValue = val),
                                width: 90.0,
                                height: 60.0,
                                searchHintTextStyle: GoogleFonts.getFont(
                                  'Roboto',
                                ),
                                searchTextStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'กรุณาเลือก...',
                                searchHintText: 'จังหวัด...',
                                fillColor: Colors.white,
                                elevation: 2.0,
                                borderColor: Color(0xFFBDBDBD),
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsets.all(0.0),
                                hidesUnderline: true,
                                isSearchable: true,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 10.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'ลักษณะการใช้รถ  : ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
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
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // บังคับให้เลือก
                            // - 110รถยนต์นั่ง
                            // - 210รถยนต์โดยสาร
                            // - 320รถยนต์บรรทุก
                            //
                            Expanded(
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.useTypeDropDownValueController ??=
                                        FormFieldController<String>(
                                  _model.useTypeDropDownValue ??= '',
                                ),
                                options: List<String>.from(FFAppState()
                                    .insuranceBasicVehicleUsedTypeCodeList),
                                optionLabels: functions
                                    .generateInsuranceVehicleTypeDropdown(
                                        FFAppState()
                                            .insuranceBasicVehicleUsedTypeCodeList
                                            .toList(),
                                        FFAppState()
                                            .insuranceBasicVehicleUsedTypeTypeList
                                            .toList(),
                                        FFAppState()
                                            .insuranceBasicVehicleUsedTypeNameList
                                            .toList())!,
                                onChanged: (val) => setState(
                                    () => _model.useTypeDropDownValue = val),
                                width: 90.0,
                                height: 60.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'กรุณาเลือก...',
                                fillColor: Colors.white,
                                elevation: 2.0,
                                borderColor: Color(0xFFBDBDBD),
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsets.all(20.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (FFAppState().insuranceVehicleTypeDropDown ==
                          'รถบรรทุก หัวลาก หางพ่วง')
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
                                  'รถใช้บรรทุกอะไร  : ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                      ),
                                )),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.35, -0.09),
                                child: SelectionArea(
                                    child: Text(
                                  'กรุณากรอก',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 15.0,
                                      ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      if (FFAppState().insuranceVehicleTypeDropDown ==
                          'รถบรรทุก หัวลาก หางพ่วง')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 15.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: TextFormField(
                                    controller:
                                        _model.logistPoposeInputController,
                                    focusNode:
                                        _model.logistPoposeInputFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.logistPoposeInputController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'กรุณากรอก...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
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
                                              .logistPoposeInputController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model
                                                    .logistPoposeInputController
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
                                          color: Color(0xFF0A0A0A),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    validator: _model
                                        .logistPoposeInputControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 10.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'มีการตกแต่งรถหรือไม่?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
                                    ),
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
                                value: _model.carModifyCheckboxValue ??= false,
                                onChanged: (newValue) async {
                                  setState(() => _model.carModifyCheckboxValue =
                                      newValue!);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                checkColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_model.carModifyCheckboxValue ?? true)
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
                                  'ต้องการคุ้มครองอุปกรณ์ตกแต่งอะไรบ้าง  :',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                      ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      if (_model.carModifyCheckboxValue ?? true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 15.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: TextFormField(
                                    controller: _model
                                        .accessoryProtectedInputController,
                                    focusNode:
                                        _model.accessoryProtectedInputFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.accessoryProtectedInputController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'กรุณากรอก...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
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
                                              .accessoryProtectedInputController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model
                                                    .accessoryProtectedInputController
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
                                          color: Color(0xFF0A0A0A),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    validator: _model
                                        .accessoryProtectedInputControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                FFAppState().customerTypeChoiceChips ==
                                        'บุคคลธรรมดา'
                                    ? 'ชื่อ : '
                                    : 'ชื่อบริษัท : ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                    ),
                              )),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'กรุณากรอก',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 15.0,
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: TextFormField(
                                  controller: _model.nameInputController,
                                  focusNode: _model.nameInputFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.nameInputController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'กรุณากรอก...',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
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
                                    suffixIcon: _model.nameInputController!.text
                                            .isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.nameInputController
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
                                        lineHeight: 1.0,
                                      ),
                                  validator: _model.nameInputControllerValidator
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                FFAppState().customerTypeChoiceChips ==
                                        'บุคคลธรรมดา'
                                    ? 'นามสกุล : '
                                    : 'ชื่อผู้ติดต่อ : ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                    ),
                              )),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'กรุณากรอก',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 15.0,
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
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: TextFormField(
                                  controller: _model.lastnameInputController,
                                  focusNode: _model.lastnameInputFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.lastnameInputController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'กรุณากรอก...',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
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
                                    suffixIcon: _model.lastnameInputController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.lastnameInputController
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
                                        color: Color(0xFF0A0A0A),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  validator: _model
                                      .lastnameInputControllerValidator
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'เบอร์โทรศัพท์มือถือ : ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                    ),
                              )),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'กรุณากรอก',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 15.0,
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
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: TextFormField(
                                  controller: _model.phoneInputController,
                                  focusNode: _model.phoneInputFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.phoneInputController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'กรุณากรอก...',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
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
                                    suffixIcon: _model.phoneInputController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.phoneInputController
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
                                        color: Color(0xFF0A0A0A),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  keyboardType: TextInputType.phone,
                                  validator: _model
                                      .phoneInputControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'บัตรประชาชน :',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 15.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _model.idInputController,
                                focusNode: _model.idInputFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.idInputController',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'กรุณากรอก...',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodySmall,
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
                                          .idInputController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.idInputController?.clear();
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
                                      color: Color(0xFF0A0A0A),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                keyboardType: TextInputType.phone,
                                validator: _model.idInputControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'หมายเหตุ :',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 15.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _model.remarkInputController,
                                focusNode: _model.remarkInputFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.remarkInputController',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'กรุณากรอก...',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodySmall,
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
                                  suffixIcon: _model.remarkInputController!.text
                                          .isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.remarkInputController
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
                                      color: Color(0xFF0A0A0A),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                validator: _model.remarkInputControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                                    if (!(_model.vehicleTypeDropDownValue !=
                                            null &&
                                        _model.vehicleTypeDropDownValue !=
                                            '')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณาเลือกประเภทรถ',
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
                                    if (functions.returnStringWithNoSpace(
                                            _model.operationChoiceChipsValue) !=
                                        'งานใหม่') {
                                      if (!(_model.insuranceLicenseNoInputController
                                                  .text !=
                                              null &&
                                          _model.insuranceLicenseNoInputController
                                                  .text !=
                                              '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณากรอกเลขกรมธรรม์เดิม',
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
                                      if (!(_model.datePicked != null)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกวันหมดอายุกรมธรรม์เดิม',
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
                                    }
                                    if (_model.idInputController.text != null &&
                                        _model.idInputController.text != '') {
                                      if (!functions.checkIdCardInput(
                                          _model.idInputController.text)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณากรอกเลขบัตรประชาชนลูกค้า 13 หลัก ให้ถูกต้อง',
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
                                    }
                                    if ((_model.vehicleTypeDropDownValue ==
                                            'รถเก๋ง') ||
                                        (_model.vehicleTypeDropDownValue ==
                                            'รถตู้')) {
                                      if (!((_model.brandInputController.text !=
                                                  null &&
                                              _model.brandInputController
                                                      .text !=
                                                  '') ||
                                          (_model.brandInputSelectedOption !=
                                                  null &&
                                              _model.brandInputSelectedOption !=
                                                  ''))) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณากรอกยี่ห้อรถ',
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
                                      if (!((_model.modelInputController.text !=
                                                  null &&
                                              _model.modelInputController
                                                      .text !=
                                                  '') ||
                                          (_model.modelInputSelectedOption !=
                                                  null &&
                                              _model.modelInputSelectedOption !=
                                                  ''))) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกรุ่นรถ',
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
                                      if (!(_model.yearDropDownValue != null &&
                                          _model.yearDropDownValue != '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกปีจดทะเบียน',
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
                                      if (!(_model.provinceDropDownValue !=
                                              null &&
                                          _model.provinceDropDownValue != '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกจังหวัดจดทะเบียน',
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
                                      if (!(_model.useTypeDropDownValue !=
                                              null &&
                                          _model.useTypeDropDownValue != '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกลักษณะการใช้รถ',
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
                                      if (!(_model.nameInputController.text !=
                                              null &&
                                          _model.nameInputController.text !=
                                              '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              functions.returnStringWithNoSpace(
                                                          _model
                                                              .customerTypeChoiceChipsValue) ==
                                                      'บุคคลธรรมดา'
                                                  ? 'กรุณากรอกชื่อลูกค้า'
                                                  : 'กรุณากรอกชื่อบริษัทลูกค้า',
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
                                      if (!(_model.lastnameInputController
                                                  .text !=
                                              null &&
                                          _model.lastnameInputController.text !=
                                              '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              functions.returnStringWithNoSpace(
                                                          _model
                                                              .customerTypeChoiceChipsValue) ==
                                                      'บุคคลธรรมดา'
                                                  ? 'กรุณากรอกนามสกุลลูกค้า'
                                                  : 'กรุณากรอกชื่อผู้ติดต่อ',
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
                                      if (!((_model.phoneInputController.text !=
                                                  null &&
                                              _model.phoneInputController
                                                      .text !=
                                                  '') &&
                                          functions.checkPhoneNumberInput(_model
                                              .phoneInputController.text)!)) {
                                        if (!(_model.phoneInputController
                                                    .text !=
                                                null &&
                                            _model.phoneInputController.text !=
                                                '')) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'กรุณากรอกเบอร์โทรศัพท์ 10 หลัก',
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณากรอกเบอร์โทรศัพท์ให้ถูกต้อง',
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
                                      if (_model.plateInputController.text !=
                                              null &&
                                          _model.plateInputController.text !=
                                              '') {
                                        if (!functions
                                            .checkIsStringLengthInLength(
                                                _model
                                                    .plateInputController.text,
                                                8)!) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'สามารถใส่ทะเบียนรถได้ไม่เกิน 8 ตัวอักษร',
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
                                              'กรุณากรอกทะเบียนรถ',
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
                                    } else if (_model
                                            .vehicleTypeDropDownValue ==
                                        'รถกระบะ') {
                                      if (!((_model.brandInputController.text !=
                                                  null &&
                                              _model.brandInputController
                                                      .text !=
                                                  '') ||
                                          (_model.brandInputSelectedOption !=
                                                  null &&
                                              _model.brandInputSelectedOption !=
                                                  ''))) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณากรอกยี่ห้อรถ',
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
                                      if (!((_model.modelInputController.text !=
                                                  null &&
                                              _model.modelInputController
                                                      .text !=
                                                  '') ||
                                          (_model.modelInputSelectedOption !=
                                                  null &&
                                              _model.modelInputSelectedOption !=
                                                  ''))) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกรุ่นรถ',
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
                                      if (!(_model.yearDropDownValue != null &&
                                          _model.yearDropDownValue != '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกปีจดทะเบียน',
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
                                      if (!(_model.provinceDropDownValue !=
                                              null &&
                                          _model.provinceDropDownValue != '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกจังหวัดจดทะเบียน',
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
                                      if (!(_model.useTypeDropDownValue !=
                                              null &&
                                          _model.useTypeDropDownValue != '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกลักษณะการใช้รถ',
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
                                      if (!(_model.nameInputController.text !=
                                              null &&
                                          _model.nameInputController.text !=
                                              '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              functions.returnStringWithNoSpace(
                                                          _model
                                                              .customerTypeChoiceChipsValue) ==
                                                      'บุคคลธรรมดา'
                                                  ? 'กรุณากรอกชื่อลูกค้า'
                                                  : 'กรุณากรอกชื่อบริษัทลูกค้า',
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
                                      if (!(_model.lastnameInputController
                                                  .text !=
                                              null &&
                                          _model.lastnameInputController.text !=
                                              '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              functions.returnStringWithNoSpace(
                                                          _model
                                                              .customerTypeChoiceChipsValue) ==
                                                      'บุคคลธรรมดา'
                                                  ? 'กรุณากรอกนามสกุลลูกค้า'
                                                  : 'กรุณากรอกชื่อผู้ติดต่อ',
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
                                      if (!((_model.phoneInputController.text !=
                                                  null &&
                                              _model.phoneInputController
                                                      .text !=
                                                  '') &&
                                          functions.checkPhoneNumberInput(_model
                                              .phoneInputController.text)!)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณากรอกเบอร์โทรศัพท์ 10 หลัก',
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
                                      if (_model.plateInputController.text !=
                                              null &&
                                          _model.plateInputController.text !=
                                              '') {
                                        if (!functions
                                            .checkIsStringLengthInLength(
                                                _model
                                                    .plateInputController.text,
                                                8)!) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'สามารถใส่ทะเบียนรถได้ไม่เกิน 8 ตัวอักษร',
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
                                              'กรุณากรอกทะเบียนรถ',
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

                                      if (_model.boxCheckboxValue!) {
                                        if (_model.boxTypeChoiceChipValue ==
                                            'ตู้เย็น') {
                                          if (_model.freezeBoxPriceInputController
                                                      .text !=
                                                  null &&
                                              _model.freezeBoxPriceInputController
                                                      .text !=
                                                  '') {
                                            if (!functions.checkIsIntValue(_model
                                                .freezeBoxPriceInputController
                                                .text)!) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'ราคาตู้+เครื่องทำความเย็น จะต้องเป็นจำนวนเต็มบาท',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 3000),
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
                                                  'กรุณากรอกราคาตู้ + เครื่องทำความเย็น',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 3000),
                                                backgroundColor:
                                                    Color(0xB2000000),
                                              ),
                                            );
                                            return;
                                          }
                                        }
                                      }
                                      setState(() {
                                        FFAppState().insuranceBasicMetalBox =
                                            _model.boxCheckboxValue!;
                                        FFAppState().insuranceBasicCoop =
                                            _model.boxCheckboxValue!
                                                ? _model.coopCheckboxValue!
                                                : false;
                                        FFAppState()
                                                .insuranceBasicPickupBoxType =
                                            _model.boxCheckboxValue!
                                                ? _model.boxTypeChoiceChipValue!
                                                : '';
                                        FFAppState()
                                            .insuranceBasicPickupBoxPrice = _model
                                                    .boxCheckboxValue! &&
                                                (_model.boxTypeChoiceChipValue ==
                                                    'ตู้เย็น')
                                            ? _model
                                                .freezeBoxPriceInputController
                                                .text
                                            : '';
                                      });
                                    } else {
                                      if (!((_model.brandInputController.text !=
                                                  null &&
                                              _model.brandInputController
                                                      .text !=
                                                  '') ||
                                          (_model.brandInputSelectedOption !=
                                                  null &&
                                              _model.brandInputSelectedOption !=
                                                  ''))) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณากรอกยี่ห้อรถ',
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
                                      if (!((_model.modelInputController.text !=
                                                  null &&
                                              _model.modelInputController
                                                      .text !=
                                                  '') ||
                                          (_model.modelInputSelectedOption !=
                                                  null &&
                                              _model.modelInputSelectedOption !=
                                                  ''))) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกรุ่นรถ',
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
                                      if (!(_model.yearDropDownValue != null &&
                                          _model.yearDropDownValue != '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกปีจดทะเบียน',
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
                                      if (!(_model.provinceDropDownValue !=
                                              null &&
                                          _model.provinceDropDownValue != '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกจังหวัดจดทะเบียน',
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
                                      if (!(_model.useTypeDropDownValue !=
                                              null &&
                                          _model.useTypeDropDownValue != '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกลักษณะการใช้รถ',
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
                                      if (!(_model.nameInputController.text !=
                                              null &&
                                          _model.nameInputController.text !=
                                              '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              functions.returnStringWithNoSpace(
                                                          _model
                                                              .customerTypeChoiceChipsValue) ==
                                                      'บุคคลธรรมดา'
                                                  ? 'กรุณากรอกชื่อลูกค้า'
                                                  : 'กรุณากรอกชื่อบริษัทลูกค้า',
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
                                      if (!(_model.lastnameInputController
                                                  .text !=
                                              null &&
                                          _model.lastnameInputController.text !=
                                              '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              functions.returnStringWithNoSpace(
                                                          _model
                                                              .customerTypeChoiceChipsValue) ==
                                                      'บุคคลธรรมดา'
                                                  ? 'กรุณากรอกนามสกุลลูกค้า'
                                                  : 'กรุณากรอกชื่อผู้ติดต่อ',
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
                                      if (!((_model.phoneInputController.text !=
                                                  null &&
                                              _model.phoneInputController
                                                      .text !=
                                                  '') &&
                                          functions.checkPhoneNumberInput(_model
                                              .phoneInputController.text)!)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณากรอกเบอร์โทรศัพท์ 10 หลัก',
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
                                      if (_model.plateInputController.text !=
                                              null &&
                                          _model.plateInputController.text !=
                                              '') {
                                        if (!(functions.checkIsIntValue(_model
                                                .plateInputController.text)! &&
                                            functions
                                                .checkIsStringLengthInLength(
                                                    _model.plateInputController
                                                        .text,
                                                    6)!)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'เลขทะเบียนหัวลาก จะต้องเป็นตัวเลขไม่เกิน 6 หลัก',
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
                                              'กรุณากรอกทะเบียนรถ',
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

                                      if (!(_model.logistPoposeInputController
                                                  .text !=
                                              null &&
                                          _model.logistPoposeInputController
                                                  .text !=
                                              '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณากรอก รถใช้บรรทุกอะไร',
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
                                      if (_model.truckPartRadioButtonValue ==
                                          'หัวลาก + หางพ่วง') {
                                        if (_model.plateAdditionalInputController
                                                    .text !=
                                                null &&
                                            _model.plateAdditionalInputController
                                                    .text !=
                                                '') {
                                          if (!(functions.checkIsIntValue(_model
                                                  .plateAdditionalInputController
                                                  .text)! &&
                                              functions.checkIsStringLengthInLength(
                                                  _model
                                                      .plateAdditionalInputController
                                                      .text,
                                                  6)!)) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'เลขทะเบียนหางพ่วง จะต้องเป็นตัวเลขไม่เกิน 6 หลัก',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 3000),
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
                                                'กรุณากรอกเลขทะเบียนหางพ่วง',
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
                                      if (!(_model.truckCurrentPriceInputController
                                                  .text ==
                                              null ||
                                          _model.truckCurrentPriceInputController
                                                  .text ==
                                              '')) {
                                        if (!functions.checkIsIntValue(_model
                                            .truckCurrentPriceInputController
                                            .text)!) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'ราคาซื้อขายปัจจุบัน จะต้องเป็นจำนวนเต็มบาท',
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
                                      setState(() {
                                        FFAppState()
                                            .insuranceBasicMemberType = _model
                                                    .vehicleTypeDropDownValue ==
                                                'รถบรรทุก หัวลาก หางพ่วง'
                                            ? (functions.returnStringWithNoSpace(
                                                        _model
                                                            .customerMemberchipChoiceChipsValue) ==
                                                    'ลูกค้าสินเชื่อ'
                                                ? '1'
                                                : '0')
                                            : '';
                                        FFAppState()
                                            .insuranceBasicTruckCurrentPrice = _model
                                                    .vehicleTypeDropDownValue ==
                                                'รถบรรทุก หัวลาก หางพ่วง'
                                            ? (_model.truckCurrentPriceInputController
                                                            .text !=
                                                        null &&
                                                    _model.truckCurrentPriceInputController
                                                            .text !=
                                                        ''
                                                ? _model
                                                    .truckCurrentPriceInputController
                                                    .text
                                                : '')
                                            : '';
                                        FFAppState()
                                                .insuranceBasicCarryPurpose =
                                            _model.vehicleTypeDropDownValue ==
                                                    'รถบรรทุก หัวลาก หางพ่วง'
                                                ? _model
                                                    .logistPoposeInputController
                                                    .text
                                                : '';
                                        FFAppState()
                                            .insuranceBasicPlateAdditional = (_model
                                                        .vehicleTypeDropDownValue ==
                                                    'รถบรรทุก หัวลาก หางพ่วง') &&
                                                (_model.truckPartRadioButtonValue ==
                                                    'หัวลาก + หางพ่วง')
                                            ? _model
                                                .plateAdditionalInputController
                                                .text
                                            : '';
                                        FFAppState().insuranceBasicTruckPart =
                                            _model.truckPartRadioButtonValue!;
                                      });
                                    }

                                    setState(() {
                                      FFAppState().operationChoiceChips =
                                          functions.returnStringWithNoSpace(
                                              _model.operationChoiceChipsValue);
                                      FFAppState().customerTypeChoiceChips =
                                          functions.returnStringWithNoSpace(
                                              _model
                                                  .customerTypeChoiceChipsValue);
                                      FFAppState().vehicleTypeDropdown =
                                          _model.vehicleTypeDropDownValue!;
                                      FFAppState().insuranceBasicCusName =
                                          functions.replaceUnderscrollToDat(
                                              _model.nameInputController.text)!;
                                      FFAppState().insuranceBasicCusLastname =
                                          functions.replaceUnderscrollToDat(
                                              _model.lastnameInputController
                                                  .text)!;
                                      FFAppState().insuranceBasicPlateNo =
                                          functions.replaceUnderscrollToDat(
                                              _model
                                                  .plateInputController.text)!;
                                      FFAppState().insuranceBasicBrandName =
                                          _model.brandInputController.text;
                                      FFAppState().insuranceBasicBrandId =
                                          functions.searchMapValueFrom2List(
                                              FFAppState()
                                                  .insuranceBasicBrandIdList
                                                  .toList(),
                                              FFAppState()
                                                  .insuranceBasicBrandNameList
                                                  .toList(),
                                              _model.brandInputController.text);
                                      FFAppState().insuranceBasicModelName =
                                          _model.modelInputController.text;
                                      FFAppState().insuranceBasicModelId =
                                          functions.searchMapValueFrom2List(
                                              FFAppState()
                                                  .insuranceBasicModelIdListOriginal
                                                  .toList(),
                                              FFAppState()
                                                  .insuranceBasicModelNameListOriginal
                                                  .toList(),
                                              _model.modelInputController.text);
                                      FFAppState().insuranceBasicYear =
                                          _model.yearDropDownValue!;
                                      FFAppState().insuranceBasicProvinceName =
                                          _model.provinceDropDownValue!;
                                      FFAppState().insuranceBasicProvinceId =
                                          functions.searchMapValueFrom2List(
                                              FFAppState()
                                                  .insuranceBasicProvinceIdList
                                                  .toList(),
                                              FFAppState()
                                                  .insuranceBasicProvinceNameList
                                                  .toList(),
                                              _model.provinceDropDownValue);
                                      FFAppState().insuranceBasicCarModify =
                                          _model.carModifyCheckboxValue!;
                                      FFAppState()
                                          .insuranceBasicAccessoryProtected = _model
                                              .carModifyCheckboxValue!
                                          ? _model
                                              .accessoryProtectedInputController
                                              .text
                                          : '';
                                      FFAppState().insuranceBasicCusPhone =
                                          _model.phoneInputController.text;
                                      FFAppState().insuranceBasicIdCardNo =
                                          _model.idInputController.text !=
                                                      null &&
                                                  _model.idInputController
                                                          .text !=
                                                      ''
                                              ? _model.idInputController.text
                                              : '';
                                      FFAppState()
                                          .insuranceBasicOldLicenseNo = functions
                                                  .returnStringWithNoSpace(_model
                                                      .operationChoiceChipsValue) ==
                                              'งานใหม่'
                                          ? ''
                                          : _model
                                              .insuranceLicenseNoInputController
                                              .text;
                                      FFAppState().insuranceBasicRemark = _model
                                                      .remarkInputController
                                                      .text !=
                                                  null &&
                                              _model.remarkInputController
                                                      .text !=
                                                  ''
                                          ? _model.remarkInputController.text
                                          : '';
                                      FFAppState()
                                              .insuranceBasicVehicleUsedTypeId =
                                          functions.searchMapValueFrom2List(
                                              FFAppState()
                                                  .insuranceBasicVehicleUsedTypeIdList
                                                  .toList(),
                                              FFAppState()
                                                  .insuranceBasicVehicleUsedTypeCodeList
                                                  .toList(),
                                              _model.useTypeDropDownValue);
                                      FFAppState()
                                              .insuranceBasicVehicleUsedTypeCode =
                                          _model.useTypeDropDownValue!;
                                      FFAppState()
                                              .insuranceBasicVehicleUsedTypeName =
                                          functions.getValueWithMappedList(
                                              FFAppState()
                                                  .insuranceBasicVehicleUsedTypeNameList
                                                  .toList(),
                                              FFAppState()
                                                  .insuranceBasicVehicleUsedTypeCodeList
                                                  .toList(),
                                              _model.useTypeDropDownValue)!;
                                      FFAppState()
                                              .insuranceBasicExpireDateOldPolicy =
                                          functions.returnStringWithNoSpace(_model
                                                      .operationChoiceChipsValue) ==
                                                  'งานใหม่'
                                              ? random_data.randomDate()
                                              : _model.datePicked;
                                    });
                                    setState(() {
                                      FFAppState()
                                              .insuranceBasicInsurerListNameRandomList =
                                          functions
                                              .randomItemList(FFAppState()
                                                  .insuranceBasicInsurerListNameList
                                                  .toList())!
                                              .toList()
                                              .cast<String>();
                                    });
                                    setState(() {
                                      FFAppState().operationChoiceChips =
                                          functions.returnStringWithNoSpace(
                                              _model.operationChoiceChipsValue);
                                    });
                                    setState(() {
                                      FFAppState().customerTypeChoiceChips =
                                          functions.returnStringWithNoSpace(
                                              _model
                                                  .customerTypeChoiceChipsValue);
                                    });
                                    setState(() {
                                      FFAppState().vehicleTypeDropdown =
                                          _model.vehicleTypeDropDownValue!;
                                    });

                                    context.pushNamed(
                                        'InsuranceRequestInsurerPage');
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
