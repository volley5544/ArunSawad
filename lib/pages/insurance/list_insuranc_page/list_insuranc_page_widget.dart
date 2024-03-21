import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_insuranc_page_model.dart';
export 'list_insuranc_page_model.dart';

class ListInsurancPageWidget extends StatefulWidget {
  const ListInsurancPageWidget({super.key});

  @override
  State<ListInsurancPageWidget> createState() => _ListInsurancPageWidgetState();
}

class _ListInsurancPageWidgetState extends State<ListInsurancPageWidget> {
  late ListInsurancPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListInsurancPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ListInsurancPage'});
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFFF6500),
          automaticallyImplyLeading: true,
          title: Text(
            'รายการเบี้ยประกัน',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 18.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 10.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  'บริษัท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                )),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SelectionArea(
                                  child: Text(
                                'ประเภท',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                    ),
                              )),
                            ),
                            Expanded(
                              flex: 1,
                              child: SelectionArea(
                                  child: Text(
                                'ซ่อม',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                    ),
                              )),
                            ),
                            Expanded(
                              flex: 2,
                              child: SelectionArea(
                                  child: Text(
                                'ราคาเบี้ย',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                    ),
                              )),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  '',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0,
                                      ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0x7F000000),
                      ),
                    ],
                  ),
                ),
                Builder(
                  builder: (context) {
                    final teleList = FFAppState().searchFullName.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: teleList.length,
                      itemBuilder: (context, teleListIndex) {
                        final teleListItem = teleList[teleListIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // บริษัท
                                  // ตัวอย่าง ประกันภัย-ไทยวิวัฒน์
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: SelectionArea(
                                          child: Text(
                                        valueOrDefault<String>(
                                          functions.showMatNameInList(
                                              FFAppState()
                                                  .searchSerialName
                                                  .toList(),
                                              teleListIndex),
                                          '[full_name]',
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      )),
                                    ),
                                  ),

                                  // ประเภท
                                  // ตัวอย่าง ชั้น 1
                                  Expanded(
                                    flex: 2,
                                    child: SelectionArea(
                                        child: Text(
                                      functions.showCoverTypeThai(
                                          functions.showMatNameInList(
                                              FFAppState()
                                                  .searchCoverType
                                                  .toList(),
                                              teleListIndex)),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 12.0,
                                          ),
                                    )),
                                  ),

                                  // ซ่อม
                                  // ตัวอย่าง ซ่อมอู๋
                                  Expanded(
                                    flex: 1,
                                    child: SelectionArea(
                                        child: Text(
                                      functions.showGarageType(
                                          functions.showMatNameInList(
                                              FFAppState()
                                                  .searchGarageType
                                                  .toList(),
                                              teleListIndex)),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 12.0,
                                          ),
                                    )),
                                  ),

                                  // ราคาเบี้ย
                                  // ตัวอย่างเป็นจำนวนเงิน 1,000
                                  Expanded(
                                    flex: 2,
                                    child: SelectionArea(
                                        child: Text(
                                      functions.showNumberWithComma(
                                          functions.showMatNameInList(
                                              FFAppState()
                                                  .searchGrossTotal
                                                  .toList(),
                                              teleListIndex)),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 12.0,
                                          ),
                                    )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'DetailInsurancePage',
                                            queryParameters: {
                                              'fullName': serializeParam(
                                                functions.showMatNameInList(
                                                    FFAppState()
                                                        .searchFullName
                                                        .toList(),
                                                    teleListIndex),
                                                ParamType.String,
                                              ),
                                              'coverType': serializeParam(
                                                functions.showCoverTypeThai(
                                                    functions.showMatNameInList(
                                                        FFAppState()
                                                            .searchCoverType
                                                            .toList(),
                                                        teleListIndex)),
                                                ParamType.String,
                                              ),
                                              'garageType': serializeParam(
                                                functions.showGarageType(
                                                    functions.showMatNameInList(
                                                        FFAppState()
                                                            .searchGarageType
                                                            .toList(),
                                                        teleListIndex)),
                                                ParamType.String,
                                              ),
                                              'grossTotal': serializeParam(
                                                functions.showMatNameInList(
                                                    FFAppState()
                                                        .searchGrossTotal
                                                        .toList(),
                                                    teleListIndex),
                                                ParamType.String,
                                              ),
                                              'sumInsured': serializeParam(
                                                functions.showMatNameInList(
                                                    FFAppState()
                                                        .searchSumInsured
                                                        .toList(),
                                                    teleListIndex),
                                                ParamType.String,
                                              ),
                                              'tppd': serializeParam(
                                                functions.showMatNameInList(
                                                    FFAppState()
                                                        .searchTppd
                                                        .toList(),
                                                    teleListIndex),
                                                ParamType.String,
                                              ),
                                              'pa': serializeParam(
                                                functions.showMatNameInList(
                                                    FFAppState()
                                                        .searchPa
                                                        .toList(),
                                                    teleListIndex),
                                                ParamType.String,
                                              ),
                                              'actAmount': serializeParam(
                                                functions.showMatNameInList(
                                                    FFAppState()
                                                        .searchActAmount
                                                        .toList(),
                                                    teleListIndex),
                                                ParamType.String,
                                              ),
                                              'expiryDate': serializeParam(
                                                functions.showMatNameInList(
                                                    FFAppState()
                                                        .searchExpDate
                                                        .toList(),
                                                    teleListIndex),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Icon(
                                          Icons.read_more_sharp,
                                          color: Colors.black,
                                          size: 26.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: Color(0x80090F13),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
