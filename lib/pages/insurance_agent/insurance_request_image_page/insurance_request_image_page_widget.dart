import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_request_image_page_model.dart';
export 'insurance_request_image_page_model.dart';

class InsuranceRequestImagePageWidget extends StatefulWidget {
  const InsuranceRequestImagePageWidget({super.key});

  @override
  State<InsuranceRequestImagePageWidget> createState() =>
      _InsuranceRequestImagePageWidgetState();
}

class _InsuranceRequestImagePageWidgetState
    extends State<InsuranceRequestImagePageWidget> {
  late InsuranceRequestImagePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceRequestImagePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'InsuranceRequestImagePage'});
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

      _model.getDateTimeServer = await GetDateTimeAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
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
            backgroundColor: Colors.white,
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
            insuranceRequestImagePageUrlLinkStorageRecordList = snapshot.data!;
        final insuranceRequestImagePageUrlLinkStorageRecord =
            insuranceRequestImagePageUrlLinkStorageRecordList.isNotEmpty
                ? insuranceRequestImagePageUrlLinkStorageRecordList.first
                : null;
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
                    'ทำเรื่องขอประกันนอกเรท (3/3)\nข้อมูลขอทรัพย์สินที่เอาประกัน',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  'หมายเหตุที่ 1 : รบกวนสาขาถ่ายรูปรถในสถานที่โล่งแจ้งพร้อมให้ลูกค้าล้างรถให้สะอาดเพื่อให้บริษัทประกันพิจารณาจากสภาพรถที่ตัวรถก่อนการรับประกัน เพื่อหลีกเลี่ยงการทำงานซ้ำซ้อน',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFFF0000),
                                        fontSize: 16.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  'หมายเหตุที่ 2 : ในกรณีลูกค้ามีอุปกรณ์เสริม อาทิเช่น การต่อเติม คอก/ตู้ทึบ/ตู้แห้ง ส่วน รถบรรทุกทุกประเภท ที่มีหางพ่วง ต้องถ่ายรูป หัวลาก กับหางพ่วง แยกขอทำประกันมา ในกรณีที่กล่าวมาข้างต้น ต้องถ่ายรูปทั้งหมดไม่ว่าจะเป็นการขอทำประกันภัยชั้น 1/2/2+/3 ต้องถ่ายรูปทั้งหมดเหมือนการขอทำประกันชั้น1',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFFF0000),
                                        fontSize: 16.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                      if ((functions
                                      .returnStringWithNoSpace(
                                          FFAppState().operationChoiceChips) ==
                                  'งานต่ออายุ') &&
                              (((_model.getDateTimeServer
                                                  ?.statusCode ??
                                              200) ==
                                          200) &&
                                      (GetDateTimeAPICall.statusLayer1(
                                            (_model.getDateTimeServer
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          200)
                                  ? (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      functions
                                          .parseStringToDatetime(GetDateTimeAPICall
                                              .currentDateYMD(
                                        (_model.getDateTimeServer?.jsonBody ??
                                            ''),
                                      ).toString())!)
                                  : (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      getCurrentTimestamp))
                          ? false
                          : (false ||
                              (FFAppState().vehicleTypeDropdown == 'รถตู้') ||
                              ((FFAppState().vehicleTypeDropdown == 'รถกระบะ') &&
                                  (FFAppState()
                                          .insuranceBasicMetalBox ==
                                      true)) ||
                              (FFAppState().insuranceBasicCoverTypeName ==
                                  'ชั้น 1') ||
                              (FFAppState().vehicleTypeDropdown ==
                                  'รถบรรทุก หัวลาก หางพ่วง')))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'ถ่ายรูปสินทรัพย์',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                ),
                          ),
                        ),
                      if ((functions
                                      .returnStringWithNoSpace(
                                          FFAppState().operationChoiceChips) ==
                                  'งานต่ออายุ') &&
                              (((_model.getDateTimeServer
                                                  ?.statusCode ??
                                              200) ==
                                          200) &&
                                      (GetDateTimeAPICall.statusLayer1(
                                            (_model.getDateTimeServer
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          200)
                                  ? (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      functions
                                          .parseStringToDatetime(GetDateTimeAPICall
                                              .currentDateYMD(
                                        (_model.getDateTimeServer?.jsonBody ??
                                            ''),
                                      ).toString())!)
                                  : (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      getCurrentTimestamp))
                          ? false
                          : (false ||
                              (FFAppState().vehicleTypeDropdown == 'รถตู้') ||
                              ((FFAppState().vehicleTypeDropdown == 'รถกระบะ') &&
                                  (FFAppState()
                                          .insuranceBasicMetalBox ==
                                      true)) ||
                              (FFAppState().insuranceBasicCoverTypeName ==
                                  'ชั้น 1') ||
                              (FFAppState().vehicleTypeDropdown ==
                                  'รถบรรทุก หัวลาก หางพ่วง')))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '*** กรุณากดที่แต่ละตำแหน่งของรถเพื่อถ่ายรูป ***',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                          ),
                        ),
                      if ((functions.returnStringWithNoSpace(
                                      FFAppState().operationChoiceChips) ==
                                  'งานต่ออายุ') &&
                              (((_model.getDateTimeServer?.statusCode ?? 200) ==
                                          200) &&
                                      (GetDateTimeAPICall.statusLayer1(
                                            (_model.getDateTimeServer
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          200)
                                  ? (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      functions.parseStringToDatetime(
                                          GetDateTimeAPICall.currentDateYMD(
                                        (_model.getDateTimeServer?.jsonBody ??
                                            ''),
                                      ).toString())!)
                                  : (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      getCurrentTimestamp))
                          ? false
                          : (false ||
                              (FFAppState().vehicleTypeDropdown == 'รถตู้') ||
                              ((FFAppState().vehicleTypeDropdown ==
                                      'รถกระบะ') &&
                                  (FFAppState().insuranceBasicMetalBox ==
                                      true)) ||
                              (FFAppState().insuranceBasicCoverTypeName ==
                                  'ชั้น 1')))
                        Container(
                          width: double.infinity,
                          height: 315.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset(
                                      'assets/images/messageImage_1691644702942.jpg',
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.05),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 1 ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading1 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading1 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile1 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile1 != null &&
                                            (_model.uploadedLocalFile1.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-0.8, -0.8),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 2ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading2 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading2 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile2 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile2 != null &&
                                            (_model.uploadedLocalFile2.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 110.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -0.8),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 3ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading3 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading3 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile3 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile3 != null &&
                                            (_model.uploadedLocalFile3.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 110.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.78, -0.7),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 4ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading4 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading4 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile4 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile4 != null &&
                                            (_model.uploadedLocalFile4.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 110.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 5ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading5 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading5 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile5 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile5 != null &&
                                            (_model.uploadedLocalFile5.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 110.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.85, 0.7),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 6ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading6 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading6 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile6 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile6 != null &&
                                            (_model.uploadedLocalFile6.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.9),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 7ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading7 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading7 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile7 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile7 != null &&
                                            (_model.uploadedLocalFile7.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.85, 0.75),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 8ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading8 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading8 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile8 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile8 != null &&
                                            (_model.uploadedLocalFile8.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 9ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading9 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading9 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile9 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile9 != null &&
                                            (_model.uploadedLocalFile9.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 160.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if ((functions.returnStringWithNoSpace(
                                      FFAppState().operationChoiceChips) ==
                                  'งานต่ออายุ') &&
                              (((_model.getDateTimeServer?.statusCode ?? 200) ==
                                          200) &&
                                      (GetDateTimeAPICall.statusLayer1(
                                            (_model.getDateTimeServer
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          200)
                                  ? (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      functions.parseStringToDatetime(
                                          GetDateTimeAPICall.currentDateYMD(
                                        (_model.getDateTimeServer?.jsonBody ??
                                            ''),
                                      ).toString())!)
                                  : (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      getCurrentTimestamp))
                          ? false
                          : (false ||
                              (FFAppState().vehicleTypeDropdown == 'รถตู้') ||
                              ((FFAppState().vehicleTypeDropdown ==
                                      'รถกระบะ') &&
                                  (FFAppState().insuranceBasicMetalBox ==
                                      true)) ||
                              (FFAppState().insuranceBasicCoverTypeName ==
                                  'ชั้น 1')))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'รูปรถแต่ละตำแหน่ง :',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ),
                                    if (false ||
                                        (FFAppState().vehicleTypeDropdown ==
                                            'รถตู้') ||
                                        ((FFAppState().vehicleTypeDropdown ==
                                                'รถกระบะ') &&
                                            (FFAppState()
                                                    .insuranceBasicMetalBox ==
                                                true)) ||
                                        (FFAppState()
                                                .insuranceBasicCoverTypeName ==
                                            'ชั้น 1'))
                                      Text(
                                        '(กรุณาถ่ายรูปให้ครบ 9 รูป)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile1 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile1
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '1.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '1.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                if ((FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถบรรทุก หัวลาก หางพ่วง') ||
                                                    (FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถตู้') ||
                                                    ((FFAppState()
                                                                .vehicleTypeDropdown ==
                                                            'รถกระบะ') &&
                                                        (FFAppState()
                                                                .insuranceBasicMetalBox ==
                                                            true)) ||
                                                    (FFAppState()
                                                            .insuranceBasicCoverTypeName ==
                                                        'ชั้น 1'))
                                                  Text(
                                                    '*',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile1 !=
                                                  null &&
                                              (_model.uploadedLocalFile1.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile1 ==
                                                  null ||
                                              (_model.uploadedLocalFile1.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile2 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile2
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '2.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '2.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                if ((FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถบรรทุก หัวลาก หางพ่วง') ||
                                                    (FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถตู้') ||
                                                    ((FFAppState()
                                                                .vehicleTypeDropdown ==
                                                            'รถกระบะ') &&
                                                        (FFAppState()
                                                                .insuranceBasicMetalBox ==
                                                            true)) ||
                                                    (FFAppState()
                                                            .insuranceBasicCoverTypeName ==
                                                        'ชั้น 1'))
                                                  Text(
                                                    '*',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile2 !=
                                                  null &&
                                              (_model.uploadedLocalFile2.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile2 ==
                                                  null ||
                                              (_model.uploadedLocalFile2.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile3 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile3
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '3.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '3.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                if ((FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถบรรทุก หัวลาก หางพ่วง') ||
                                                    (FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถตู้') ||
                                                    ((FFAppState()
                                                                .vehicleTypeDropdown ==
                                                            'รถกระบะ') &&
                                                        (FFAppState()
                                                                .insuranceBasicMetalBox ==
                                                            true)) ||
                                                    (FFAppState()
                                                            .insuranceBasicCoverTypeName ==
                                                        'ชั้น 1'))
                                                  Text(
                                                    '*',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile3 !=
                                                  null &&
                                              (_model.uploadedLocalFile3.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile3 ==
                                                  null ||
                                              (_model.uploadedLocalFile3.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile4 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile4
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '4.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '4.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                if ((FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถบรรทุก หัวลาก หางพ่วง') ||
                                                    (FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถตู้') ||
                                                    ((FFAppState()
                                                                .vehicleTypeDropdown ==
                                                            'รถกระบะ') &&
                                                        (FFAppState()
                                                                .insuranceBasicMetalBox ==
                                                            true)) ||
                                                    (FFAppState()
                                                            .insuranceBasicCoverTypeName ==
                                                        'ชั้น 1'))
                                                  Text(
                                                    '*',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile4 !=
                                                  null &&
                                              (_model.uploadedLocalFile4.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile4 ==
                                                  null ||
                                              (_model.uploadedLocalFile4.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile5 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile5
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '5.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '5.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                if ((FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถบรรทุก หัวลาก หางพ่วง') ||
                                                    (FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถตู้') ||
                                                    ((FFAppState()
                                                                .vehicleTypeDropdown ==
                                                            'รถกระบะ') &&
                                                        (FFAppState()
                                                                .insuranceBasicMetalBox ==
                                                            true)) ||
                                                    (FFAppState()
                                                            .insuranceBasicCoverTypeName ==
                                                        'ชั้น 1'))
                                                  Text(
                                                    '*',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile5 !=
                                                  null &&
                                              (_model.uploadedLocalFile5.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile5 ==
                                                  null ||
                                              (_model.uploadedLocalFile5.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile6 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile6
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '6.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '6.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                if ((FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถบรรทุก หัวลาก หางพ่วง') ||
                                                    (FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถตู้') ||
                                                    ((FFAppState()
                                                                .vehicleTypeDropdown ==
                                                            'รถกระบะ') &&
                                                        (FFAppState()
                                                                .insuranceBasicMetalBox ==
                                                            true)) ||
                                                    (FFAppState()
                                                            .insuranceBasicCoverTypeName ==
                                                        'ชั้น 1'))
                                                  Text(
                                                    '*',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile6 !=
                                                  null &&
                                              (_model.uploadedLocalFile6.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile6 ==
                                                  null ||
                                              (_model.uploadedLocalFile6.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile7 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile7
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '7.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '7.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                if ((FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถบรรทุก หัวลาก หางพ่วง') ||
                                                    (FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถตู้') ||
                                                    ((FFAppState()
                                                                .vehicleTypeDropdown ==
                                                            'รถกระบะ') &&
                                                        (FFAppState()
                                                                .insuranceBasicMetalBox ==
                                                            true)) ||
                                                    (FFAppState()
                                                            .insuranceBasicCoverTypeName ==
                                                        'ชั้น 1'))
                                                  Text(
                                                    '*',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile7 !=
                                                  null &&
                                              (_model.uploadedLocalFile7.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile7 ==
                                                  null ||
                                              (_model.uploadedLocalFile7.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile8 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile8
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '8.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '8.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                if ((FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถบรรทุก หัวลาก หางพ่วง') ||
                                                    (FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถตู้') ||
                                                    ((FFAppState()
                                                                .vehicleTypeDropdown ==
                                                            'รถกระบะ') &&
                                                        (FFAppState()
                                                                .insuranceBasicMetalBox ==
                                                            true)) ||
                                                    (FFAppState()
                                                            .insuranceBasicCoverTypeName ==
                                                        'ชั้น 1'))
                                                  Text(
                                                    '*',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile8 !=
                                                  null &&
                                              (_model.uploadedLocalFile8.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile8 ==
                                                  null ||
                                              (_model.uploadedLocalFile8.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile9 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile9
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '9.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '9.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                if ((FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถบรรทุก หัวลาก หางพ่วง') ||
                                                    (FFAppState()
                                                            .vehicleTypeDropdown ==
                                                        'รถตู้') ||
                                                    ((FFAppState()
                                                                .vehicleTypeDropdown ==
                                                            'รถกระบะ') &&
                                                        (FFAppState()
                                                                .insuranceBasicMetalBox ==
                                                            true)) ||
                                                    (FFAppState()
                                                            .insuranceBasicCoverTypeName ==
                                                        'ชั้น 1'))
                                                  Text(
                                                    '*',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile9 !=
                                                  null &&
                                              (_model.uploadedLocalFile9.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile9 ==
                                                  null ||
                                              (_model.uploadedLocalFile9.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if ((functions.returnStringWithNoSpace(
                                      FFAppState().operationChoiceChips) ==
                                  'งานต่ออายุ') &&
                              (((_model.getDateTimeServer?.statusCode ?? 200) ==
                                          200) &&
                                      (GetDateTimeAPICall.statusLayer1(
                                            (_model.getDateTimeServer
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          200)
                                  ? (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      functions.parseStringToDatetime(
                                          GetDateTimeAPICall.currentDateYMD(
                                        (_model.getDateTimeServer?.jsonBody ??
                                            ''),
                                      ).toString())!)
                                  : (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      getCurrentTimestamp))
                          ? false
                          : (FFAppState().vehicleTypeDropdown ==
                              'รถบรรทุก หัวลาก หางพ่วง'))
                        Container(
                          width: double.infinity,
                          height: 315.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset(
                                      'assets/images/messageImage_1691644188590.jpg',
                                      width: double.infinity,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.15),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 1 ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading10 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading10 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile10 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile10 !=
                                                null &&
                                            (_model.uploadedLocalFile10.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 120.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-0.8, -0.7),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 2ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading11 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading11 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile11 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile11 !=
                                                null &&
                                            (_model.uploadedLocalFile11.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 110.0,
                                        height: 90.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 3ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading12 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading12 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile12 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile12 !=
                                                null &&
                                            (_model.uploadedLocalFile12.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 110.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.78, -0.8),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 4ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading13 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading13 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile13 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile13 !=
                                                null &&
                                            (_model.uploadedLocalFile13.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.15),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 5ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading14 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading14 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile14 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile14 !=
                                                null &&
                                            (_model.uploadedLocalFile14.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 120.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 6ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading15 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading15 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile15 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile15 !=
                                                null &&
                                            (_model.uploadedLocalFile15.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 120.0,
                                        height: 90.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.1, 0.95),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 7ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading16 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading16 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile16 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile16 !=
                                                null &&
                                            (_model.uploadedLocalFile16.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 120.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 8ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading17 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading17 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile17 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile17 !=
                                                null &&
                                            (_model.uploadedLocalFile17.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 150.0,
                                        height: 90.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if ((functions.returnStringWithNoSpace(
                                      FFAppState().operationChoiceChips) ==
                                  'งานต่ออายุ') &&
                              (((_model.getDateTimeServer?.statusCode ?? 200) ==
                                          200) &&
                                      (GetDateTimeAPICall.statusLayer1(
                                            (_model.getDateTimeServer
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          200)
                                  ? (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      functions.parseStringToDatetime(
                                          GetDateTimeAPICall.currentDateYMD(
                                        (_model.getDateTimeServer?.jsonBody ??
                                            ''),
                                      ).toString())!)
                                  : (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      getCurrentTimestamp))
                          ? false
                          : (FFAppState().vehicleTypeDropdown ==
                              'รถบรรทุก หัวลาก หางพ่วง'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'รูปหัวลากแต่ละตำแหน่ง :',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Text(
                                      '(กรุณาถ่ายรูปให้ครบ 8 รูป)',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile10 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile10
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '1.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '1.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile10 !=
                                                  null &&
                                              (_model.uploadedLocalFile10.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile10 ==
                                                  null ||
                                              (_model.uploadedLocalFile10.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile11 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile11
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '2.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '2.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile11 !=
                                                  null &&
                                              (_model.uploadedLocalFile11.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile11 ==
                                                  null ||
                                              (_model.uploadedLocalFile11.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile12 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile12
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '3.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '3.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile12 !=
                                                  null &&
                                              (_model.uploadedLocalFile12.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile12 ==
                                                  null ||
                                              (_model.uploadedLocalFile12.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile13 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile13
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '4.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '4.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile13 !=
                                                  null &&
                                              (_model.uploadedLocalFile13.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile13 ==
                                                  null ||
                                              (_model.uploadedLocalFile13.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile14 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile14
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '5.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '5.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile14 !=
                                                  null &&
                                              (_model.uploadedLocalFile14.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile14 ==
                                                  null ||
                                              (_model.uploadedLocalFile14.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile15 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile15
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '6.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '6.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile15 !=
                                                  null &&
                                              (_model.uploadedLocalFile15.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile15 ==
                                                  null ||
                                              (_model.uploadedLocalFile15.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile16 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile16
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '7.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '7.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile16 !=
                                                  null &&
                                              (_model.uploadedLocalFile16.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile16 ==
                                                  null ||
                                              (_model.uploadedLocalFile16.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile17 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile17
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '8.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '8.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile17 !=
                                                  null &&
                                              (_model.uploadedLocalFile17.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile17 ==
                                                  null ||
                                              (_model.uploadedLocalFile17.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if ((functions.returnStringWithNoSpace(
                                      FFAppState().operationChoiceChips) ==
                                  'งานต่ออายุ') &&
                              (((_model.getDateTimeServer?.statusCode ?? 200) ==
                                          200) &&
                                      (GetDateTimeAPICall.statusLayer1(
                                            (_model.getDateTimeServer
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          200)
                                  ? (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      functions.parseStringToDatetime(
                                          GetDateTimeAPICall.currentDateYMD(
                                        (_model.getDateTimeServer?.jsonBody ??
                                            ''),
                                      ).toString())!)
                                  : (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      getCurrentTimestamp))
                          ? false
                          : ((FFAppState().insuranceBasicTruckPart ==
                                  'หัวลาก + หางพ่วง') &&
                              (FFAppState().vehicleTypeDropdown ==
                                  'รถบรรทุก หัวลาก หางพ่วง')))
                        Container(
                          width: double.infinity,
                          height: 315.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset(
                                      'assets/images/messageImage_1691644649383.jpg',
                                      width: double.infinity,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.15),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 1 ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading18 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading18 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile18 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile18 !=
                                                null &&
                                            (_model.uploadedLocalFile18.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 120.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-0.8, -0.7),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 2ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading19 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading19 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile19 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile19 !=
                                                null &&
                                            (_model.uploadedLocalFile19.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 110.0,
                                        height: 90.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -0.85),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 3ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading20 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading20 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile20 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile20 !=
                                                null &&
                                            (_model.uploadedLocalFile20.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 110.0,
                                        height: 90.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.8, -0.8),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 4ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading21 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading21 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile21 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile21 !=
                                                null &&
                                            (_model.uploadedLocalFile21.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.15),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 5ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading22 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading22 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile22 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile22 !=
                                                null &&
                                            (_model.uploadedLocalFile22.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 120.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 6ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading23 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading23 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile23 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile23 !=
                                                null &&
                                            (_model.uploadedLocalFile23.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 120.0,
                                        height: 90.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.1, 0.95),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 7ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading24 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading24 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile24 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile24 !=
                                                null &&
                                            (_model.uploadedLocalFile24.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 120.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 8ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          return;
                                        }
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          includeBlurHash: true,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading25 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading25 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile25 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile25 !=
                                                null &&
                                            (_model.uploadedLocalFile25.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
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
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                      },
                                      child: Container(
                                        width: 150.0,
                                        height: 90.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if ((functions.returnStringWithNoSpace(
                                      FFAppState().operationChoiceChips) ==
                                  'งานต่ออายุ') &&
                              (((_model.getDateTimeServer?.statusCode ?? 200) ==
                                          200) &&
                                      (GetDateTimeAPICall.statusLayer1(
                                            (_model.getDateTimeServer
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          200)
                                  ? (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      functions.parseStringToDatetime(
                                          GetDateTimeAPICall.currentDateYMD(
                                        (_model.getDateTimeServer?.jsonBody ??
                                            ''),
                                      ).toString())!)
                                  : (FFAppState()
                                          .insuranceBasicExpireDateOldPolicy! >=
                                      getCurrentTimestamp))
                          ? false
                          : ((FFAppState().insuranceBasicTruckPart ==
                                  'หัวลาก + หางพ่วง') &&
                              (FFAppState().vehicleTypeDropdown ==
                                  'รถบรรทุก หัวลาก หางพ่วง')))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'รูปหางพ่วงแต่ละตำแหน่ง :',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Text(
                                      '(กรุณาถ่ายรูปให้ครบ 8 รูป)',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 14.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile18 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile18
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '1.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '1.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile18 !=
                                                  null &&
                                              (_model.uploadedLocalFile18.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile18 ==
                                                  null ||
                                              (_model.uploadedLocalFile18.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile19 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile19
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '2.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '2.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile19 !=
                                                  null &&
                                              (_model.uploadedLocalFile19.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile19 ==
                                                  null ||
                                              (_model.uploadedLocalFile19.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile20 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile20
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '3.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '3.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile20 !=
                                                  null &&
                                              (_model.uploadedLocalFile20.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile20 ==
                                                  null ||
                                              (_model.uploadedLocalFile20.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile21 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile21
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '4.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '4.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile21 !=
                                                  null &&
                                              (_model.uploadedLocalFile21.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile21 ==
                                                  null ||
                                              (_model.uploadedLocalFile21.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile22 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile22
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '5.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '5.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile22 !=
                                                  null &&
                                              (_model.uploadedLocalFile22.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile22 ==
                                                  null ||
                                              (_model.uploadedLocalFile22.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile23 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile23
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '6.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '6.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile23 !=
                                                  null &&
                                              (_model.uploadedLocalFile23.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile23 ==
                                                  null ||
                                              (_model.uploadedLocalFile23.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile24 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile24
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '7.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '7.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile24 !=
                                                  null &&
                                              (_model.uploadedLocalFile24.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile24 ==
                                                  null ||
                                              (_model.uploadedLocalFile24.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile25 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile25
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? '8.สถานะ : อัพโหลดเรียบร้อย'
                                                        : '8.สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile25 !=
                                                  null &&
                                              (_model.uploadedLocalFile25.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          if (_model.uploadedLocalFile25 ==
                                                  null ||
                                              (_model.uploadedLocalFile25.bytes
                                                      ?.isEmpty ??
                                                  true))
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF2B2B),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'ถ่ายรูปเอกสารเพิ่มเติม',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.35, -0.09),
                                              child: SelectionArea(
                                                  child: Text(
                                                'หน้าเล่มรถ(รายการจดทะเบียนล่าสุด)  :',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                        ),
                                              )),
                                            ),
                                            Text(
                                              '(กรุณาถ่ายรูป)',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 4.0, 15.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                final selectedMedia =
                                                    await selectMedia(
                                                  imageQuality: 30,
                                                  includeBlurHash: true,
                                                  multiImage: false,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() =>
                                                      _model.isDataUploading26 =
                                                          true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();
                                                  } finally {
                                                    _model.isDataUploading26 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile26 =
                                                          selectedUploadedFiles
                                                              .first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                if (_model.uploadedLocalFile26 !=
                                                        null &&
                                                    (_model
                                                            .uploadedLocalFile26
                                                            .bytes
                                                            ?.isNotEmpty ??
                                                        false)) {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'อัพโหลดรูปภาพสำเร็จ',
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
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                              },
                                              text: 'ถ่ายรูป',
                                              options: FFButtonOptions(
                                                width: 80.0,
                                                height: 30.0,
                                                padding: EdgeInsets.all(0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 4.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.35, -0.09),
                                              child: SelectionArea(
                                                  child: Text(
                                                FFAppState().customerTypeChoiceChips ==
                                                        'บุคคลธรรมดา'
                                                    ? 'สำเนาบัตรประชาชนผู้เอาประกัน :'
                                                    : 'หนังสือจดทะเบียนบริษัท+บัตรประชาชนกรรมการ :',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                        ),
                                              )),
                                            ),
                                            Text(
                                              '(กรุณาถ่ายรูป)',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 4.0, 15.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                final selectedMedia =
                                                    await selectMedia(
                                                  imageQuality: 30,
                                                  includeBlurHash: true,
                                                  multiImage: false,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() =>
                                                      _model.isDataUploading27 =
                                                          true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();
                                                  } finally {
                                                    _model.isDataUploading27 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile27 =
                                                          selectedUploadedFiles
                                                              .first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                if (_model.uploadedLocalFile27 !=
                                                        null &&
                                                    (_model
                                                            .uploadedLocalFile27
                                                            .bytes
                                                            ?.isNotEmpty ??
                                                        false)) {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'อัพโหลดรูปภาพสำเร็จ',
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
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                              },
                                              text: 'ถ่ายรูป',
                                              options: FFButtonOptions(
                                                width: 80.0,
                                                height: 30.0,
                                                padding: EdgeInsets.all(0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 4.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.35, -0.09),
                                              child: SelectionArea(
                                                  child: Text(
                                                'เอกสารอื่นๆ (ใส่ได้ไม่เกิน 5 รูป) : ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                        ),
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 4.0, 15.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                final selectedMedia =
                                                    await selectMedia(
                                                  imageQuality: 30,
                                                  includeBlurHash: true,
                                                  multiImage: false,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() =>
                                                      _model.isDataUploading28 =
                                                          true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();
                                                  } finally {
                                                    _model.isDataUploading28 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile28 =
                                                          selectedUploadedFiles
                                                              .first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                if (_model.uploadedLocalFile28 !=
                                                        null &&
                                                    (_model
                                                            .uploadedLocalFile28
                                                            .bytes
                                                            ?.isNotEmpty ??
                                                        false)) {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'อัพโหลดรูปภาพสำเร็จ',
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
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                              },
                                              text: 'ถ่ายรูป',
                                              options: FFButtonOptions(
                                                width: 80.0,
                                                height: 30.0,
                                                padding: EdgeInsets.all(0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'เอกสารอื่นๆ เช่น เล่มรถหางพ่วง',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 10.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (_model.uploadedLocalFile28 != null &&
                                          (_model.uploadedLocalFile28.bytes
                                                  ?.isNotEmpty ??
                                              false))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 4.0, 15.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    imageQuality: 30,
                                                    includeBlurHash: true,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    setState(() => _model
                                                            .isDataUploading29 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading29 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      setState(() {
                                                        _model.uploadedLocalFile29 =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      setState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (_model.uploadedLocalFile29 !=
                                                          null &&
                                                      (_model
                                                              .uploadedLocalFile29
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปภาพสำเร็จ',
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
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                                },
                                                text: 'ถ่ายรูป',
                                                options: FFButtonOptions(
                                                  width: 80.0,
                                                  height: 30.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'เอกสารอื่นๆ 2',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (_model.uploadedLocalFile29 != null &&
                                          (_model.uploadedLocalFile29.bytes
                                                  ?.isNotEmpty ??
                                              false))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 4.0, 15.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    imageQuality: 30,
                                                    includeBlurHash: true,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    setState(() => _model
                                                            .isDataUploading30 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading30 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      setState(() {
                                                        _model.uploadedLocalFile30 =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      setState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (_model.uploadedLocalFile30 !=
                                                          null &&
                                                      (_model
                                                              .uploadedLocalFile30
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปภาพสำเร็จ',
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
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                                },
                                                text: 'ถ่ายรูป',
                                                options: FFButtonOptions(
                                                  width: 80.0,
                                                  height: 30.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'เอกสารอื่นๆ 3',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (_model.uploadedLocalFile30 != null &&
                                          (_model.uploadedLocalFile30.bytes
                                                  ?.isNotEmpty ??
                                              false))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 4.0, 15.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    imageQuality: 30,
                                                    includeBlurHash: true,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    setState(() => _model
                                                            .isDataUploading31 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading31 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      setState(() {
                                                        _model.uploadedLocalFile31 =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      setState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (_model.uploadedLocalFile31 !=
                                                          null &&
                                                      (_model
                                                              .uploadedLocalFile31
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปภาพสำเร็จ',
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
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                                },
                                                text: 'ถ่ายรูป',
                                                options: FFButtonOptions(
                                                  width: 80.0,
                                                  height: 30.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'เอกสารอื่นๆ 4',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (_model.uploadedLocalFile31 != null &&
                                          (_model.uploadedLocalFile31.bytes
                                                  ?.isNotEmpty ??
                                              false))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 4.0, 15.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    imageQuality: 30,
                                                    includeBlurHash: true,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    setState(() => _model
                                                            .isDataUploading32 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading32 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      setState(() {
                                                        _model.uploadedLocalFile32 =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      setState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (_model.uploadedLocalFile32 !=
                                                          null &&
                                                      (_model
                                                              .uploadedLocalFile32
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปภาพสำเร็จ',
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
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                                },
                                                text: 'ถ่ายรูป',
                                                options: FFButtonOptions(
                                                  width: 80.0,
                                                  height: 30.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'เอกสารอื่นๆ 5',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              _model.uploadedLocalFile26 !=
                                                          null &&
                                                      (_model
                                                              .uploadedLocalFile26
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false)
                                                  ? '1.สถานะ : อัพโหลดเรียบร้อย'
                                                  : '1.สถานะ : ยังไม่อัพโหลด',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            '*',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (_model.uploadedLocalFile26 != null &&
                                        (_model.uploadedLocalFile26.bytes
                                                ?.isNotEmpty ??
                                            false))
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Icon(
                                            Icons.check,
                                            color: Color(0xFF2EDD78),
                                            size: 18.0,
                                          ),
                                        ),
                                      ),
                                    if (_model.uploadedLocalFile26 == null ||
                                        (_model.uploadedLocalFile26.bytes
                                                ?.isEmpty ??
                                            true))
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Icon(
                                            Icons.close,
                                            color: Color(0xFFFF2B2B),
                                            size: 18.0,
                                          ),
                                        ),
                                      ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                _model.uploadedLocalFile27 !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile27
                                                                .bytes
                                                                ?.isNotEmpty ??
                                                            false)
                                                    ? '2.สถานะ : อัพโหลดเรียบร้อย'
                                                    : '2.สถานะ : ยังไม่อัพโหลด',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              '*',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (_model.uploadedLocalFile27 != null &&
                                          (_model.uploadedLocalFile27.bytes
                                                  ?.isNotEmpty ??
                                              false))
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Icon(
                                              Icons.check,
                                              color: Color(0xFF2EDD78),
                                              size: 18.0,
                                            ),
                                          ),
                                        ),
                                      if (_model.uploadedLocalFile27 == null ||
                                          (_model.uploadedLocalFile27.bytes
                                                  ?.isEmpty ??
                                              true))
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Icon(
                                              Icons.close,
                                              color: Color(0xFFFF2B2B),
                                              size: 18.0,
                                            ),
                                          ),
                                        ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (_model.uploadedLocalFile28 != null &&
                                (_model.uploadedLocalFile28.bytes?.isNotEmpty ??
                                    false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '3.เอกสารอื่นๆ1 : อัพโหลดเรียบร้อย',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Icon(
                                              Icons.check,
                                              color: Color(0xFF2EDD78),
                                              size: 18.0,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (_model.uploadedLocalFile29 != null &&
                                (_model.uploadedLocalFile29.bytes?.isNotEmpty ??
                                    false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '4.เอกสารอื่นๆ2 : อัพโหลดเรียบร้อย',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Icon(
                                              Icons.check,
                                              color: Color(0xFF2EDD78),
                                              size: 18.0,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (_model.uploadedLocalFile30 != null &&
                                (_model.uploadedLocalFile30.bytes?.isNotEmpty ??
                                    false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '5.เอกสารอื่นๆ3 : อัพโหลดเรียบร้อย',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Icon(
                                              Icons.check,
                                              color: Color(0xFF2EDD78),
                                              size: 18.0,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (_model.uploadedLocalFile31 != null &&
                                (_model.uploadedLocalFile31.bytes?.isNotEmpty ??
                                    false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '6.เอกสารอื่นๆ4 : อัพโหลดเรียบร้อย',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Icon(
                                              Icons.check,
                                              color: Color(0xFF2EDD78),
                                              size: 18.0,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (_model.uploadedLocalFile32 != null &&
                                (_model.uploadedLocalFile32.bytes?.isNotEmpty ??
                                    false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '7.เอกสารอื่นๆ5 : อัพโหลดเรียบร้อย',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Icon(
                                              Icons.check,
                                              color: Color(0xFF2EDD78),
                                              size: 18.0,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
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
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    HapticFeedback.mediumImpact();
                                    if (!((functions.returnStringWithNoSpace(
                                                FFAppState()
                                                    .operationChoiceChips) ==
                                            'งานต่ออายุ') &&
                                        (((_model.getDateTimeServer
                                                            ?.statusCode ??
                                                        200) ==
                                                    200) &&
                                                (GetDateTimeAPICall
                                                        .statusLayer1(
                                                      (_model.getDateTimeServer
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) ==
                                                    200)
                                            ? (FFAppState()
                                                    .insuranceBasicExpireDateOldPolicy! >=
                                                functions.parseStringToDatetime(
                                                    GetDateTimeAPICall
                                                        .currentDateYMD(
                                                  (_model.getDateTimeServer
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString())!)
                                            : (FFAppState()
                                                    .insuranceBasicExpireDateOldPolicy! >=
                                                getCurrentTimestamp)))) {
                                      if (FFAppState().vehicleTypeDropdown ==
                                          'รถบรรทุก หัวลาก หางพ่วง') {
                                        if (!((_model.uploadedLocalFile10 !=
                                                    null &&
                                                (_model.uploadedLocalFile10.bytes?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile11 != null &&
                                                (_model.uploadedLocalFile11
                                                        .bytes?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile12 != null &&
                                                (_model.uploadedLocalFile12
                                                        .bytes?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile13 != null &&
                                                (_model.uploadedLocalFile13
                                                        .bytes?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile14 != null &&
                                                (_model.uploadedLocalFile14
                                                        .bytes?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile15 != null &&
                                                (_model.uploadedLocalFile15
                                                        .bytes?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile16 != null &&
                                                (_model.uploadedLocalFile16
                                                        .bytes?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile17 != null &&
                                                (_model.uploadedLocalFile17
                                                        .bytes?.isNotEmpty ??
                                                    false)))) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณาถ่ายรูปหัวลากทั้ง 8 รูป'),
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
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                        if ((FFAppState()
                                                    .insuranceBasicTruckPart ==
                                                'หัวลาก + หางพ่วง') &&
                                            (FFAppState().vehicleTypeDropdown ==
                                                'รถบรรทุก หัวลาก หางพ่วง')) {
                                          if (!((_model.uploadedLocalFile18 !=
                                                      null &&
                                                  (_model.uploadedLocalFile18.bytes
                                                          ?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile19 != null &&
                                                  (_model.uploadedLocalFile19.bytes
                                                          ?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile20 != null &&
                                                  (_model.uploadedLocalFile20.bytes
                                                          ?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile21 != null &&
                                                  (_model.uploadedLocalFile21
                                                          .bytes?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile22 != null &&
                                                  (_model.uploadedLocalFile22
                                                          .bytes?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile23 != null &&
                                                  (_model.uploadedLocalFile23
                                                          .bytes?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile24 != null &&
                                                  (_model.uploadedLocalFile24
                                                          .bytes?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile25 != null &&
                                                  (_model.uploadedLocalFile25
                                                          .bytes?.isNotEmpty ??
                                                      false)))) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'กรุณาถ่ายรูปหางพ่วงทั้ง8รูป',
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
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                        }
                                      } else if (((FFAppState()
                                                      .vehicleTypeDropdown ==
                                                  'รถกระบะ') &&
                                              (FFAppState()
                                                      .insuranceBasicMetalBox ==
                                                  true)) ||
                                          (FFAppState().vehicleTypeDropdown ==
                                              'รถตู้')) {
                                        if (!((_model.uploadedLocalFile1 !=
                                                    null &&
                                                (_model.uploadedLocalFile1.bytes?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile2 != null &&
                                                (_model.uploadedLocalFile2.bytes?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile3 !=
                                                    null &&
                                                (_model.uploadedLocalFile3.bytes?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile4 !=
                                                    null &&
                                                (_model.uploadedLocalFile4.bytes?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile5 !=
                                                    null &&
                                                (_model.uploadedLocalFile5.bytes?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile6 !=
                                                    null &&
                                                (_model.uploadedLocalFile6.bytes
                                                        ?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile7 !=
                                                    null &&
                                                (_model.uploadedLocalFile7.bytes
                                                        ?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile8 !=
                                                    null &&
                                                (_model.uploadedLocalFile8.bytes
                                                        ?.isNotEmpty ??
                                                    false)) &&
                                            (_model.uploadedLocalFile9 !=
                                                    null &&
                                                (_model.uploadedLocalFile9.bytes
                                                        ?.isNotEmpty ??
                                                    false)))) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณาถ่ายรูปรถทั้ง 9 รูป'),
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
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        if (FFAppState()
                                                .insuranceBasicCoverTypeName ==
                                            'ชั้น 1') {
                                          if (!((_model.uploadedLocalFile1 != null && (_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false)) &&
                                              (_model.uploadedLocalFile2 != null &&
                                                  (_model.uploadedLocalFile2
                                                          .bytes?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile3 != null &&
                                                  (_model.uploadedLocalFile3
                                                          .bytes?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile4 != null &&
                                                  (_model.uploadedLocalFile4
                                                          .bytes?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile5 != null &&
                                                  (_model.uploadedLocalFile5
                                                          .bytes?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile6 != null &&
                                                  (_model.uploadedLocalFile6
                                                          .bytes?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile7 != null &&
                                                  (_model.uploadedLocalFile7
                                                          .bytes?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile8 != null &&
                                                  (_model.uploadedLocalFile8
                                                          .bytes?.isNotEmpty ??
                                                      false)) &&
                                              (_model.uploadedLocalFile9 != null &&
                                                  (_model.uploadedLocalFile9
                                                          .bytes?.isNotEmpty ??
                                                      false)))) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'กรุณาถ่ายรูปรถทั้ง 9 รูป'),
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
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                        }
                                      }
                                    }
                                    if (!(_model.uploadedLocalFile26 != null &&
                                        (_model.uploadedLocalFile26.bytes
                                                ?.isNotEmpty ??
                                            false))) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'กรุณาถ่ายรูปหน้าเล่มรถ'),
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
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    if (!(_model.uploadedLocalFile27 != null &&
                                        (_model.uploadedLocalFile27.bytes
                                                ?.isNotEmpty ??
                                            false))) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(FFAppState()
                                                          .customerTypeChoiceChips ==
                                                      'บุคคลธรรมดา'
                                                  ? 'กรุณาถ่ายรูปสำเนาบัตรประชาชนผู้เอาประกัน'
                                                  : 'กรุณาถ่ายรูปหนังสือจดทะเบียนบริษัท+บัตรประชาชนกรรมการ'),
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
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'คุณต้องการจะบันทึกข้อมูลหรือไม่?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('ยกเลิก'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('บันทึก'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (!confirmDialogResponse) {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    _model.sendEmailRequestApi =
                                        await InsuranceRequestSendEmailAPICall
                                            .call(
                                      carBrandId:
                                          FFAppState().insuranceBasicBrandId,
                                      carBrandName:
                                          FFAppState().insuranceBasicBrandName,
                                      carModelId:
                                          FFAppState().insuranceBasicModelId,
                                      carModelName:
                                          FFAppState().insuranceBasicModelName,
                                      firstName:
                                          FFAppState().insuranceBasicCusName,
                                      lastName: FFAppState()
                                          .insuranceBasicCusLastname,
                                      phoneNumber:
                                          FFAppState().insuranceBasicCusPhone,
                                      driverType: '',
                                      carProvinceCode:
                                          FFAppState().insuranceBasicProvinceId,
                                      carProvinceName: FFAppState()
                                          .insuranceBasicProvinceName,
                                      idNumber:
                                          FFAppState().insuranceBasicIdCardNo,
                                      carRegistration:
                                          FFAppState().insuranceBasicPlateNo,
                                      carRegistrationYear:
                                          FFAppState().insuranceBasicYear,
                                      vehicleId: FFAppState()
                                          .insuranceBasicVehicleUsedTypeId,
                                      vehicleCode: FFAppState()
                                          .insuranceBasicVehicleUsedTypeCode,
                                      vehicleName: FFAppState()
                                          .insuranceBasicVehicleUsedTypeName,
                                      idType: '1',
                                      branchCode: FFAppState().profileBranch,
                                      insurerCodeList: FFAppState()
                                          .insuranceBasicInsurerCodeOutput,
                                      insurerIdList: FFAppState()
                                          .insuranceBasicInsurerIdOutput,
                                      insurerNameList: FFAppState()
                                          .insuranceBasicInsurerFullNameOutput,
                                      insurerShortNameList: FFAppState()
                                          .insuranceBasicInsurerShortNameOutput,
                                      coverTypeIdList:
                                          functions.createListByItemNumber(
                                              FFAppState()
                                                  .insuranceBasicCoverTypeId,
                                              FFAppState()
                                                  .insuranceBasicInsurerFullNameOutput
                                                  .length),
                                      coverTypeCodeList:
                                          functions.createListByItemNumber(
                                              FFAppState()
                                                  .insuranceBasicCoverTypeCode,
                                              FFAppState()
                                                  .insuranceBasicInsurerFullNameOutput
                                                  .length),
                                      coverTypeNameList:
                                          functions.createListByItemNumber(
                                              FFAppState()
                                                  .insuranceBasicCoverTypeName,
                                              FFAppState()
                                                  .insuranceBasicInsurerFullNameOutput
                                                  .length),
                                      garageTypeIdList:
                                          functions.createListByItemNumber(
                                              FFAppState()
                                                  .insuranceBasicGarageId,
                                              FFAppState()
                                                  .insuranceBasicInsurerFullNameOutput
                                                  .length),
                                      garageTypeNameList:
                                          functions.createListByItemNumber(
                                              FFAppState()
                                                  .insuranceBasicGarageName,
                                              FFAppState()
                                                  .insuranceBasicInsurerFullNameOutput
                                                  .length),
                                      companyName: '',
                                      flgRenew:
                                          FFAppState().operationChoiceChips !=
                                                  'งานใหม่'
                                              ? '1'
                                              : '0',
                                      oldVMIPolicyNumber: FFAppState()
                                          .insuranceBasicOldLicenseNo,
                                      flgDecoration:
                                          FFAppState().insuranceBasicCarModify
                                              ? '1'
                                              : '0',
                                      decorationDetail: FFAppState()
                                          .insuranceBasicAccessoryProtected,
                                      flgCarrier: FFAppState()
                                                  .vehicleTypeDropdown ==
                                              'รถกระบะ'
                                          ? (FFAppState().insuranceBasicMetalBox
                                              ? '1'
                                              : '0')
                                          : '',
                                      flgCoOrg:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถกระบะ'
                                              ? (FFAppState().insuranceBasicCoop
                                                  ? '1'
                                                  : '0')
                                              : '',
                                      carrierType:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถกระบะ'
                                              ? FFAppState()
                                                  .insuranceBasicPickupBoxType
                                              : '',
                                      carrierPrice:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถกระบะ'
                                              ? FFAppState()
                                                  .insuranceBasicPickupBoxPrice
                                              : '',
                                      customerType:
                                          FFAppState().customerTypeChoiceChips,
                                      trailerCarRegistration: (FFAppState()
                                                      .vehicleTypeDropdown ==
                                                  'รถบรรทุก หัวลาก หางพ่วง') &&
                                              (FFAppState()
                                                      .insuranceBasicTruckPart !=
                                                  'เฉพาะหัวลาก')
                                          ? FFAppState()
                                              .insuranceBasicPlateAdditional
                                          : '',
                                      carrierPropose:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถบรรทุก หัวลาก หางพ่วง'
                                              ? FFAppState()
                                                  .insuranceBasicCarryPurpose
                                              : '',
                                      remark: FFAppState().insuranceBasicRemark,
                                      imageFront:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถบรรทุก หัวลาก หางพ่วง'
                                              ? _model.uploadedLocalFile10
                                              : _model.uploadedLocalFile1,
                                      imageRightfront:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถบรรทุก หัวลาก หางพ่วง'
                                              ? _model.uploadedLocalFile11
                                              : _model.uploadedLocalFile2,
                                      imageRight:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถบรรทุก หัวลาก หางพ่วง'
                                              ? _model.uploadedLocalFile12
                                              : _model.uploadedLocalFile3,
                                      imageRightrear:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถบรรทุก หัวลาก หางพ่วง'
                                              ? _model.uploadedLocalFile13
                                              : _model.uploadedLocalFile4,
                                      imageRear:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถบรรทุก หัวลาก หางพ่วง'
                                              ? _model.uploadedLocalFile14
                                              : _model.uploadedLocalFile5,
                                      imageLeftrear:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถบรรทุก หัวลาก หางพ่วง'
                                              ? _model.uploadedLocalFile15
                                              : _model.uploadedLocalFile6,
                                      imageLeft:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถบรรทุก หัวลาก หางพ่วง'
                                              ? _model.uploadedLocalFile16
                                              : _model.uploadedLocalFile7,
                                      imageLeftfront:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถบรรทุก หัวลาก หางพ่วง'
                                              ? _model.uploadedLocalFile17
                                              : _model.uploadedLocalFile8,
                                      imageRoof: _model.uploadedLocalFile9,
                                      imageFrontTrailer:
                                          _model.uploadedLocalFile18,
                                      imageRightfrontTrailer:
                                          _model.uploadedLocalFile19,
                                      imageRightTrailer:
                                          _model.uploadedLocalFile20,
                                      imageRightrearTrailer:
                                          _model.uploadedLocalFile21,
                                      imageRearTrailer:
                                          _model.uploadedLocalFile22,
                                      imageLeftrearTrailer:
                                          _model.uploadedLocalFile23,
                                      imageLeftTrailer:
                                          _model.uploadedLocalFile24,
                                      imageLeftfrontTrailer:
                                          _model.uploadedLocalFile25,
                                      imageRoofTrailer: null,
                                      imageBluebook: _model.uploadedLocalFile26,
                                      imageIdcard: _model.uploadedLocalFile27,
                                      imageApplication: null,
                                      imageExamination: null,
                                      imageOther1: _model.uploadedLocalFile28,
                                      imageOther2: _model.uploadedLocalFile29,
                                      imageOther3: _model.uploadedLocalFile30,
                                      imageOther4: _model.uploadedLocalFile31,
                                      imageOther5: _model.uploadedLocalFile32,
                                      apiUrl:
                                          insuranceRequestImagePageUrlLinkStorageRecord
                                              ?.urlLink,
                                      carType: FFAppState().vehicleTypeDropdown,
                                      customerMemberchip:
                                          FFAppState().vehicleTypeDropdown ==
                                                  'รถบรรทุก หัวลาก หางพ่วง'
                                              ? FFAppState()
                                                  .insuranceBasicMemberType
                                              : '',
                                      truckPart: FFAppState()
                                                  .vehicleTypeDropdown ==
                                              'รถบรรทุก หัวลาก หางพ่วง'
                                          ? (FFAppState()
                                                      .insuranceBasicTruckPart ==
                                                  'เฉพาะหัวลาก'
                                              ? '0'
                                              : '1')
                                          : '',
                                      flgAct:
                                          FFAppState().insuranceBasicActFlag,
                                      sumInsured:
                                          FFAppState().insuranceBasicSumInsured,
                                      trailerSumInsured: (FFAppState()
                                                      .vehicleTypeDropdown ==
                                                  'รถบรรทุก หัวลาก หางพ่วง') &&
                                              (FFAppState()
                                                      .insuranceBasicTruckPart !=
                                                  'เฉพาะหัวลาก')
                                          ? FFAppState()
                                              .insuranceBasicTrailerSumInsured
                                          : '',
                                      truckCurrentPrice: FFAppState()
                                                  .vehicleTypeDropdown ==
                                              'รถบรรทุก หัวลาก หางพ่วง'
                                          ? FFAppState()
                                              .insuranceBasicTruckCurrentPrice
                                          : '',
                                      token: FFAppState().accessToken,
                                    );
                                    _shouldSetState = true;
                                    if (InsuranceRequestSendEmailAPICall
                                            .statusLayer2(
                                          (_model.sendEmailRequestApi
                                                  ?.jsonBody ??
                                              ''),
                                        ) ==
                                        FFAppState().successStatusCode) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  InsuranceRequestSendEmailAPICall
                                                              .statusLayer2(
                                                            (_model.sendEmailRequestApi
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          FFAppState()
                                                              .successStatusCode
                                                      ? InsuranceRequestSendEmailAPICall
                                                          .resultInfo(
                                                          (_model.sendEmailRequestApi
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString()
                                                      : InsuranceRequestSendEmailAPICall
                                                          .resultInfo(
                                                          (_model.sendEmailRequestApi
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString()),
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
                                                  InsuranceRequestSendEmailAPICall
                                                              .statusLayer2(
                                                            (_model.sendEmailRequestApi
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          FFAppState()
                                                              .successStatusCode
                                                      ? InsuranceRequestSendEmailAPICall
                                                          .resultInfo(
                                                          (_model.sendEmailRequestApi
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString()
                                                      : InsuranceRequestSendEmailAPICall
                                                          .resultInfo(
                                                          (_model.sendEmailRequestApi
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString()),
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
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if ((FFAppState().employeeID == '33511') ||
                                        (FFAppState().employeeID == '36270')) {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    setState(() {
                                      FFAppState()
                                              .insuranceVehicleTypeDropDown =
                                          'กรุณาเลือก';
                                    });

                                    context
                                        .goNamed('InsuranceRequestBasicPage');

                                    context.goNamed(
                                        'InsuranceRequestDashboardPage');

                                    if (_shouldSetState) setState(() {});
                                  },
                                  text: 'บันทึก',
                                  options: FFButtonOptions(
                                    width: 300.0,
                                    height: 40.0,
                                    padding: EdgeInsets.all(0.0),
                                    iconPadding: EdgeInsets.all(0.0),
                                    color: Color(0xFF00E062),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ].addToEnd(SizedBox(height: 75.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
