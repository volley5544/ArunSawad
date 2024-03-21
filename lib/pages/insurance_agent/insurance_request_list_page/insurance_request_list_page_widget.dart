import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_request_list_page_model.dart';
export 'insurance_request_list_page_model.dart';

class InsuranceRequestListPageWidget extends StatefulWidget {
  const InsuranceRequestListPageWidget({super.key});

  @override
  State<InsuranceRequestListPageWidget> createState() =>
      _InsuranceRequestListPageWidgetState();
}

class _InsuranceRequestListPageWidgetState
    extends State<InsuranceRequestListPageWidget> {
  late InsuranceRequestListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceRequestListPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'InsuranceRequestListPage'});
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

      _model.getRequestList = await InsuranceRequestListAPICall.call(
        apiUrl: FFAppState().apiUrlInsurance,
        token: FFAppState().accessToken,
        ownerId: FFAppState().employeeID,
        mode: 'arunsawad',
      );
      if ((_model.getRequestList?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดConnection (${(_model.getRequestList?.statusCode ?? 200).toString()})'),
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
        return;
      }
      if (InsuranceRequestListAPICall.statusLayer2(
            (_model.getRequestList?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${InsuranceRequestListAPICall.statusLayer2(
                  (_model.getRequestList?.jsonBody ?? ''),
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
      }
      setState(() {
        FFAppState().insuranceOperationChoiceChips = 'งานใหม่          ';
        FFAppState().insuranceCustomerTypeChoiceChips = 'บุคคลธรรมดา';
        FFAppState().insuranceBoxCheckbokValue = false;
        FFAppState().insuranceBoxTypeChoiceChip = 'ตู้แห้ง';
        FFAppState().insuranceVehicleTypeDropDown = 'กรุณาเลือก';
      });
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

    return FutureBuilder<List<UrlLinkStorageRecord>>(
      future: queryUrlLinkStorageRecordOnce(
        queryBuilder: (urlLinkStorageRecord) => urlLinkStorageRecord.where(
          'url_name',
          isEqualTo: 'insurance_request_api_url',
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
          );
        }
        List<UrlLinkStorageRecord>
            insuranceRequestListPageUrlLinkStorageRecordList = snapshot.data!;
        final insuranceRequestListPageUrlLinkStorageRecord =
            insuranceRequestListPageUrlLinkStorageRecordList.isNotEmpty
                ? insuranceRequestListPageUrlLinkStorageRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                      context.goNamed('InsuranceRequestDashboardPage');
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xFBFFFFFF),
                      size: 30.0,
                    ),
                  ),
                  title: Text(
                    'รายการขอประกัน',
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 30.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Spacer(),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'ประเภท',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              'ชื่อ-สกุล',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'ประกัน',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'ดำเนินการ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(width: 8.0))
                            .addToEnd(SizedBox(width: 8.0)),
                      ),
                    ),
                    if (((_model.getRequestList?.statusCode ?? 200) == 200) &&
                        (InsuranceRequestListAPICall.statusLayer2(
                              (_model.getRequestList?.jsonBody ?? ''),
                            ) ==
                            200) &&
                        (InsuranceRequestListAPICall.listTotal(
                              (_model.getRequestList?.jsonBody ?? ''),
                            )! >
                            0))
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final requestListItem =
                                InsuranceRequestListAPICall.leadId(
                                      (_model.getRequestList?.jsonBody ?? ''),
                                    )?.toList() ??
                                    [];
                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                12.0,
                                0,
                                12.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: requestListItem.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 8.0),
                              itemBuilder: (context, requestListItemIndex) {
                                final requestListItemItem =
                                    requestListItem[requestListItemIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        (requestListItemIndex! + 1).toString(),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 11.0,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        functions.checkNullValueAndReturn(
                                                    InsuranceRequestListAPICall
                                                        .flagRenew(
                                                  (_model.getRequestList
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[requestListItemIndex]) ==
                                                '-'
                                            ? 'ข้อมูลผิด'
                                            : ((InsuranceRequestListAPICall
                                                        .flagRenew(
                                                      (_model.getRequestList
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?[requestListItemIndex]) ==
                                                    FFAppState()
                                                        .insuranceBasicListFlagRenew
                                                ? 'งานต่ออายุ'
                                                : 'งานใหม่'),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 11.0,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        '${InsuranceRequestListAPICall.firstname(
                                          (_model.getRequestList?.jsonBody ??
                                              ''),
                                        )?[requestListItemIndex]} ${InsuranceRequestListAPICall.lastname(
                                          (_model.getRequestList?.jsonBody ??
                                              ''),
                                        )?[requestListItemIndex]}',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 11.0,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          functions.checkNullValueAndReturn(
                                              InsuranceRequestListAPICall
                                                  .coverTypeName(
                                            (_model.getRequestList?.jsonBody ??
                                                ''),
                                          )?[requestListItemIndex]),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 11.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onLongPress: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'ปุ่มแก้ไขรายการขอประกัน'),
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
                                            },
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                LoadingSceneWidget(),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                _model.getInsuranceDetail =
                                                    await InsuranceRequestDetailAPICall
                                                        .call(
                                                  apiUrl: FFAppState()
                                                      .apiUrlInsurance,
                                                  token:
                                                      FFAppState().accessToken,
                                                  leadId:
                                                      (InsuranceRequestListAPICall
                                                              .leadId(
                                                    (_model.getRequestList
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?[requestListItemIndex])
                                                          ?.toString(),
                                                );
                                                Navigator.pop(context);

                                                context.goNamed(
                                                  'InsuranceRequestEditPage',
                                                  queryParameters: {
                                                    'leadId': serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .leadId(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?.toString(),
                                                      ParamType.String,
                                                    ),
                                                    'leadNo': serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .leadNo(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                    'idCardNumber':
                                                        serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .idCardNumber(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'firstname': serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .firstname(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'lastname': serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .lastname(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'phoneNumber':
                                                        serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .phoneNumber(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'carType': serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .carType(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'brandName': serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .brandName(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'modelName': serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .modelName(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'provinceName':
                                                        serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .province(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'plateNo': serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .plateNo(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'year': serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .year(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'vehicleTypeCode':
                                                        serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .vehicleCode(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'flagRenew': serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .flagRenew(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'oldVmiPolicyNumber':
                                                        serializeParam(
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .oldVmiPolicyNumber(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'flagDecoration':
                                                        serializeParam(
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .flagDecoration(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'decorationDetail':
                                                        serializeParam(
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .decorationDetail(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'flagCarrier':
                                                        serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .flagCarrier(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'flagCoop': serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .flagCoop(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'carrierType':
                                                        serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .carrierType(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'carrierPrice':
                                                        serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .carrierPrice(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'customerType':
                                                        serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .customerType(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'truckPart': serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .truckPart(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'customerMemberchip':
                                                        serializeParam(
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .customerMemberchip(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'trailerPlateNo':
                                                        serializeParam(
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .trailerPlateNo(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString()),
                                                      ParamType.String,
                                                    ),
                                                    'carrierPropose':
                                                        serializeParam(
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .carrierPropose(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'remark': serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .remark(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'trailerSumInsured':
                                                        serializeParam(
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .trailerSumInsured(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString()),
                                                      ParamType.String,
                                                    ),
                                                    'flagAct': serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .flagAct(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'truckCurrentPrice':
                                                        serializeParam(
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .truckCurrentPrice(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'sumInsured':
                                                        serializeParam(
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .sumInsured(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      ParamType.String,
                                                    ),
                                                    'insurerShortNameList':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .insurerShortName(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'insurerNameList':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .insurerNameList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'coverTypeNameList':
                                                        serializeParam(
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .coverTypeNameList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?[0]),
                                                      ParamType.String,
                                                    ),
                                                    'garageTypeName':
                                                        serializeParam(
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .garageTypeNameList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?[0]),
                                                      ParamType.String,
                                                    ),
                                                    'imageFront':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageFrontList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageRear': serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageRearList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageLeft': serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageLeftList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageRight':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageRightList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageRightFront':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageRightFrontList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageRightRear':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageRightRearList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageLeftFront':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageLeftFrontList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageLeftRear':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageLeftRearList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageRoof': serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageRoofList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageFrontTrailer':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageFrontTrailerList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageRearTrailer':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageRearTrailerList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageLeftTrailer':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageLeftTrailerList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageRightTrailer':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageRightTrailerList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageRightFrontTrailer':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageRightFrontTrailerList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageRightRearTrailer':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageRightRearTrailerList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageLeftFrontTrailer':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageLeftFrontTrailerList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageLeftRearTrailer':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageLeftRearTrailerList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageBlueBook':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageBluebookList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageIdCard':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageIdCardList(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                    'imageOther':
                                                        serializeParam(
                                                      getJsonField(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.results.info[:].leads_detail[:].image_other''',
                                                        true,
                                                      ),
                                                      ParamType.JSON,
                                                      true,
                                                    ),
                                                    'imageOtherName':
                                                        serializeParam(
                                                      InsuranceRequestDetailAPICall
                                                          .imageOtherName(
                                                        (_model.getInsuranceDetail
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                setState(() {});
                                              },
                                              text: '',
                                              icon: Icon(
                                                Icons.edit_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayIcon,
                                                size: 20.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 30.0,
                                                height: 30.0,
                                                padding: EdgeInsets.all(0.0),
                                                iconPadding:
                                                    EdgeInsets.all(5.0),
                                                color: Colors.white,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onLongPress: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'ปุ่มคัดลอกรายการขอประกัน เพื่อทำรายการใหม่'),
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
                                            },
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                LoadingSceneWidget(),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                _model.getInsuranceDetailDup =
                                                    await InsuranceRequestDetailAPICall
                                                        .call(
                                                  apiUrl: FFAppState()
                                                      .apiUrlInsurance,
                                                  token:
                                                      FFAppState().accessToken,
                                                  leadId:
                                                      (InsuranceRequestListAPICall
                                                              .leadId(
                                                    (_model.getRequestList
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?[requestListItemIndex])
                                                          ?.toString(),
                                                );
                                                setState(() {
                                                  FFAppState().fromPage =
                                                      'ListPage';
                                                });
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicIdCardNo =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .idCardNumber(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicCusName =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .firstname(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicCusLastname =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .lastname(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicCusPhone =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .phoneNumber(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .vehicleTypeDropdown =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .carType(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicBrandName =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .brandName(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicModelName =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .modelName(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicProvinceName =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .province(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicPlateNo =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .plateNo(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicYear =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .year(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicVehicleUsedTypeCode =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .vehicleCode(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .operationChoiceChips =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .flagRenew(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicOldLicenseNo =
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .oldVmiPolicyNumber(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                      .insuranceBasicCarModify = functions
                                                              .checkNullValueAndReturn(
                                                                  InsuranceRequestDetailAPICall
                                                                      .flagDecoration(
                                                            (_model.getInsuranceDetailDup
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )) ==
                                                          '-'
                                                      ? false
                                                      : (functions.checkNullValueAndReturn(
                                                                  InsuranceRequestDetailAPICall
                                                                      .flagDecoration(
                                                                (_model.getInsuranceDetailDup
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )) ==
                                                              '0'
                                                          ? false
                                                          : true);
                                                  FFAppState()
                                                          .insuranceBasicAccessoryProtected =
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .decorationDetail(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                      .isEquipedMetalBox = functions
                                                              .checkNullValueAndReturn(
                                                                  InsuranceRequestDetailAPICall
                                                                      .flagCarrier(
                                                            (_model.getInsuranceDetailDup
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )) ==
                                                          '-'
                                                      ? false
                                                      : (functions.checkNullValueAndReturn(
                                                                  InsuranceRequestDetailAPICall
                                                                      .flagCarrier(
                                                                (_model.getInsuranceDetailDup
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )) ==
                                                              '0'
                                                          ? false
                                                          : true);
                                                  FFAppState()
                                                      .insuranceBasicCoop = functions
                                                              .checkNullValueAndReturn(
                                                                  InsuranceRequestDetailAPICall
                                                                      .flagCoop(
                                                            (_model.getInsuranceDetailDup
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )) ==
                                                          '-'
                                                      ? false
                                                      : (functions.checkNullValueAndReturn(
                                                                  InsuranceRequestDetailAPICall
                                                                      .flagCoop(
                                                                (_model.getInsuranceDetailDup
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )) ==
                                                              '0'
                                                          ? false
                                                          : true);
                                                  FFAppState()
                                                          .insuranceBasicPickupBoxType =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .carrierType(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicPickupBoxPrice =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .carrierPrice(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .customerTypeChoiceChips =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .customerType(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicTruckPart =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .truckPart(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicMemberType =
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .customerMemberchip(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicPlateAdditional =
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .trailerPlateNo(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString());
                                                  FFAppState()
                                                          .insuranceBasicCarryPurpose =
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .carrierPropose(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicRemark =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .remark(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicTrailerSumInsured =
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .trailerSumInsured(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString());
                                                  FFAppState()
                                                          .insuranceBasicActFlag =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .flagAct(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicTruckCurrentPrice =
                                                      functions.checkNullValueAndReturn(
                                                          InsuranceRequestDetailAPICall
                                                              .truckCurrentPrice(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicSumInsured =
                                                      functions
                                                          .checkNullValueAndReturn(
                                                              InsuranceRequestDetailAPICall
                                                                  .sumInsured(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                  FFAppState()
                                                          .insuranceBasicInsurerFullNameOutput =
                                                      InsuranceRequestDetailAPICall
                                                              .insurerNameList(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                          .toList()
                                                          .cast<String>();
                                                  FFAppState()
                                                          .insuranceBasicCoverTypeName =
                                                      InsuranceRequestDetailAPICall
                                                              .coverTypeNameList(
                                                    (_model.getInsuranceDetailDup
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                          .first;
                                                });
                                                Navigator.pop(context);

                                                context.goNamed(
                                                    'InsuranceRequestBasicPage');

                                                setState(() {});
                                              },
                                              text: '',
                                              icon: Icon(
                                                Icons.content_copy,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayIcon,
                                                size: 20.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 30.0,
                                                height: 30.0,
                                                padding: EdgeInsets.all(0.0),
                                                iconPadding:
                                                    EdgeInsets.all(5.0),
                                                color: Colors.white,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 8.0))
                                            .addToStart(SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ]
                                      .addToStart(SizedBox(width: 8.0))
                                      .addToEnd(SizedBox(width: 8.0)),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    if (false)
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            12.0,
                            0,
                            12.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '1',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    'วรรธนัย แสงสุนทร',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '0864113456',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'ชั้น 1',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 11.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.content_copy,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: Color(0xFFFC9A0C),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .addToStart(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(width: 8.0))
                                  .addToEnd(SizedBox(width: 8.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '2',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: Text(
                                      'บริษัท เอเท็ค จำกัด (มหาชน) วรรธนัย แสงสุนทร',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 11.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '0000000000',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'ชั้น 2',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 11.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.content_copy,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: Color(0xFFFC9A0C),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .addToStart(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(width: 8.0))
                                  .addToEnd(SizedBox(width: 8.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '3',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    'Cognosphere Pte., Ltd. วิชชากร ไกรรมย์สม',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '0981233223',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'ชั้น 2+',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 11.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.content_copy,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: Color(0xFFFC9A0C),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .addToStart(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(width: 8.0))
                                  .addToEnd(SizedBox(width: 8.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '4',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    'มนฑิรา ยอดแสง',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '0961123332',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'ชั้น 3',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 11.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.content_copy,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: Color(0xFFFC9A0C),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .addToStart(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(width: 8.0))
                                  .addToEnd(SizedBox(width: 8.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '5',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    'ก้องเกียรติ บุญเส็ง',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '0864113456',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'ชั้น 3+',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 11.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.content_copy,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: Color(0xFFFC9A0C),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .addToStart(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(width: 8.0))
                                  .addToEnd(SizedBox(width: 8.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '6',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    'ปัทมาพร คุณภู่',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '0864113456',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'ชั้น 3',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 11.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.content_copy,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: Color(0xFFFC9A0C),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .addToStart(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(width: 8.0))
                                  .addToEnd(SizedBox(width: 8.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '7',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    'ปนัดดา อริยะทรัพย์',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '0864113456',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'ชั้น 2+',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 11.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.content_copy,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 30.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding: EdgeInsets.all(5.0),
                                          color: Color(0xFFFC9A0C),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .addToStart(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(width: 8.0))
                                  .addToEnd(SizedBox(width: 8.0)),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                  ]
                      .addToStart(SizedBox(height: 12.0))
                      .addToEnd(SizedBox(height: 12.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
