import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tiktok_splash_page_model.dart';
export 'tiktok_splash_page_model.dart';

class TiktokSplashPageWidget extends StatefulWidget {
  const TiktokSplashPageWidget({super.key});

  @override
  State<TiktokSplashPageWidget> createState() => _TiktokSplashPageWidgetState();
}

class _TiktokSplashPageWidgetState extends State<TiktokSplashPageWidget> {
  late TiktokSplashPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TiktokSplashPageModel());

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

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 8.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x98101213),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  constraints: BoxConstraints(
                    maxWidth: 700.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.5, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Text(
                                            'ประกาศรายชื่อผู้ชนะ กิจกรรม TIKTOK STAR 2023',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF101213),
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: FlutterFlowIconButton(
                                    borderRadius: 30.0,
                                    buttonSize: 44.0,
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: Color(0xFFFF0000),
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/ArunSawad%20Banner%20Img%2FAD2-tiktok-%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B2%E0%B8%A8%E0%B8%A3%E0%B8%B2%E0%B8%87%E0%B8%A7%E0%B8%B1%E0%B8%A5-1920x1020.jpg?alt=media&token=06afd233-1869-4582-8511-52409f5d634e',
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              '       ทางแผนกการตลาด ขอขอบคุณเพื่อนๆพนักงานสาขาที่ให้ความร่วมมือ ส่งคลิปเข้ามาร่วมการประกวด TIKTOK STAR 2023\nหลังจากที่คณะกรรมการพิจารณาคลิปวีดีโอทั้งหมดแล้ว ตัดสินจากผู้เข้าร่วมที่ทำถูกต้องตามกติกา และมีความคิดสร้างสรรค์ กล้าคิด กล้าแสดงออก\nมีความยินดีที่จะประกาศรายชื่อผู้ชนะทั้ง 8 คน ที่ได้รับเงินรางวัลคนละ 3,000 บาท\nมีรายชื่อดังต่อไปนี้',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final winnerListItem = FFAppState()
                                      .tiktokEmployeeIdList
                                      .toList();
                                  return Container(
                                    width: double.infinity,
                                    height: 400.0,
                                    child: DataTable2(
                                      columns: [
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              'ชื่อ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              'นามสกุล',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              'รหัสพนักงาน',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      rows: winnerListItem
                                          .mapIndexed((winnerListItemIndex,
                                                  winnerListItemItem) =>
                                              [
                                                Text(
                                                  FFAppState().tiktokNameList[
                                                      winnerListItemIndex],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  FFAppState()
                                                          .tiktokLastnameList[
                                                      winnerListItemIndex],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  FFAppState()
                                                          .tiktokEmployeeIdList[
                                                      winnerListItemIndex],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ]
                                                  .map((c) => DataCell(c))
                                                  .toList())
                                          .map((e) => DataRow(cells: e))
                                          .toList(),
                                      headingRowColor:
                                          MaterialStateProperty.all(
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      headingRowHeight: 56.0,
                                      dataRowColor: MaterialStateProperty.all(
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      dataRowHeight: 40.0,
                                      border: TableBorder(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      dividerThickness: 1.0,
                                      columnSpacing: 0.0,
                                      showBottomBorder: false,
                                      minWidth: 49.0,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'ขั้นตอนการยืนยันรับเงินรางวัล',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF101213),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              '1. เตรียมสำเนาบัตรประจำตัวประชน,สำเนาหน้าสมุดบัญชีธนาคาร (Book Bank),บัตรพนักงาน พร้อมคาดคำว่า “ใช้เพื่อรับเงินประกวด Tiktok Star 2023 เท่านั้น”\n2. ส่งเอกสารมาที่ e-mail tanus.a@srisawadpower.com พร้อม cc กรุ๊ปการตลาด mrk@srisawadpower.com\nโดยใช้หัวข้ออีเมลว่า “ส่งเอกสารยืนยันรับเงินรางวัลกิจกรรม Tiktok Star 2023”\n3. ส่งเอกสารดังกล่าวกลับมาภายในวันที่ 14 ก.ค. 2566 มิเช่นนั้นจะถือว่าท่านสละสิทธิ์ในการรับเงินรางวัล',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 50.0),
                            child: Text(
                              '4. ท่านจะได้รับเงินโดยการโอนเงินเข้าบัญชีธนาคารภายใน 31 สิงหาคม 2566*เงินรางวัล 3,000 บาท จะถูกหักภาษี ณ ที่จ่าย 3% เป็นจำนวน 90 บาท ท่านจะได้รับยอดเงิน 2,910 บาทถ้วน',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
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
      ),
    );
  }
}
