import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tiktok_splash_page_model.dart';
export 'tiktok_splash_page_model.dart';

class TiktokSplashPageWidget extends StatefulWidget {
  const TiktokSplashPageWidget({Key? key}) : super(key: key);

  @override
  _TiktokSplashPageWidgetState createState() => _TiktokSplashPageWidgetState();
}

class _TiktokSplashPageWidgetState extends State<TiktokSplashPageWidget> {
  late TiktokSplashPageModel _model;

  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TiktokSplashPageModel());
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
                  height: MediaQuery.of(context).size.height * 1.0,
                  constraints: BoxConstraints(
                    maxWidth: 700.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 5.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
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
                                            'ตามหาตัวตึง-ตัวแม่แห่งศรีสวัสดิ์ กับโครงการ \n“SRISAWAD TIKTOK STAR 2023”',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF101213),
                                                  fontSize: 22.0,
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
                            'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/tiktokEventImg%2FAD2-tiktok-Srisawad-star3.png?alt=media&token=a4fa1338-c710-4db1-a842-89042a268c1c',
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              'แผนกการตลาดสำนักงานใหญ่ ขอเชิญชวนพี่น้องสาขาทุกท่าน เข้าร่วมกิจกรรม “SRISAWAD TIKTOK STAR 2023” ครั้งที่ 1  ตามหาตัวตึง-ตัวแม่แห่งศรีสวัสดิ์ ประกวดทำคลิป TIKTOK เชิญชวนมาใช้บริการศรีสวัสดิ์ เงินสดทันใจ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              'ลุ้นรับรางวัลเงินสดทั้งสิ้น 20 รางวัล รวมมูลค่ากว่า 50,000 บาท จาก CCK',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 24.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: SelectionArea(
                                child: Text(
                              '    กติกาการร่วมสนุก\n    1.ทำคลิปเชิญชวนลูกค้าเข้ามาใช้บริการศรีสวัสดิ์ เงินสดทันใจ ผ่านแพลตฟอร์ม Tiktok  ตามหัวข้อที่กำหนดในแต่ละเขตพื้นที่ (ดูรายละเอียดในหัวข้อถัดไป)\n\n    2.โพสต์คลิปลงช่องทางของท่าน พร้อมติด #ศรีสวัสดิ์เงินสดทันใจ\n    3.Copy link โพสต์ของท่านและส่งมาที่ link https://forms.gle/AbkZ9RVmxA6SMmQZ9\n    4.สามารถส่งคลิปได้ตั้งแต่วันนี้ถึง 22 กุมภาพันธ์ 2566 \n    5.ประกาศผลรางวัล 8 มีนาคม 2566 ที่หน้าแอพฯอรุณสวัสดิ์ ARUNSAWAD\n    6.ความยาวของคลิป ตามที่แพลตฟอร์ม Tiktok กำหนด แนะนำว่าไม่ควรเกิน 60 วินาที\n    7.ไม่จำกัดจำนวนคลิปที่ส่งเข้าประกวด\n    8.หากพบปัญหาการใช้งานหรือสอบถามเพิ่มเติมสามารถติดต่อได้กรุ๊ปการตลาด mrk@srisawadpower.com หรือโทร 063-2028426\n*การเข้าร่วมกิจกรรมถือว่าเป็นการยินยอมให้บริษัทฯ นำวีดีโอดังกล่าวใช้เพื่อโฆษณาและประชาสัมพันธ์',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color:
                                        FlutterFlowTheme.of(context).black600,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            )),
                          ),
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).grayIcon,
                          ),
                          Text(
                            '    หัวข้อที่กำหนดของแต่ละเขตพื้นที่\n    1.โซนพื้นที่เกษตรกรรม :หัวข้อที่กำหนด : สินเชื่อรถการเกษตร, สินเชื่อเช่าซื้อรถไถ (New Holland), สินเชื่อรถบรรทุก, สินเชื่อรถยนต์,สินเชื่อร้านโชว์ห่วย\n    2.โซนพื้นที่เมืองท่องเที่ยวและเมืองเศรษฐกิจหัวข้อที่กำหนด : สินเชื่อรถยนต์/สินเชื่อรถบรรทุก/สินเชื่อบ้าน ที่ดิน\n    3.โซนพื้นที่กลุ่มอุตสากรรมและจังหวัดชายแดนหัวข้อที่กำหนด : สินเชื่อรถบรรทุก/สินเชื่อรถยนต์/สินเชื่อบ้าน ที่ดิน',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).black600,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            '**สำคัญ** ต้องใส่คำว่า “*เงื่อนไขการจัดสินเชื่อเบื้องต้นเป็นไปตามที่บริษัทฯ กำหนด” ไว้ตลอดคลิป\n    1 หัวข้อ ต่อ 1 คลิปเท่านั้น / 1 คนสามารถส่งได้ไม่จำกัดจำนวนคลิป',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFFF0000),
                                  fontSize: 16.0,
                                ),
                          ),
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).grayIcon,
                          ),
                          Text(
                            '    เกณฑ์การตัดสิน\n1.ความคิดสร้างสรรค์ในการผลิตผลงาน VDO และการกล้าแสดงออก\n2.ในคลิปสามารถชวนเพื่อนพนักงานมาถ่ายด้วยกันได้แต่การตัดสินให้เงินรางวัลจะให้เฉพาะเจ้าของ Account Tiktok ที่ทำการ Submit ข้อมูลมาเท่านั้น\n3.หากทำคลิปโดยพูดหัวข้อนอกเหนือจากหัวข้อที่กำหนดของแต่ละเขตพื้นที่จะถือว่าสละสิทธิ์ในคลิปนั้นๆ\n    รายละเอียดเกี่ยวกับการถ่ายทำ VDO\n1.ต้องใส่ชุดพนักงาน ถูกระเบียบ เรียบร้อย\n2.ไม่พูดคำหยาบในคลิป\n3.ไม่ถ่ายให้เห็นข้อมูลสำคัญของบริษัท เช่น หน้าจอ, ป้ายประกาศภายใน\n4.ไม่ถ่ายให้เห็นใบหน้าของบุคคลอื่นเช่นใบหน้าลูกค้าหรือเอกสารสำคัญที่เห็นชื่อลูกค้าไม่จำกัดรูปแบบ/ฟิลเตอร์/แผ่นเสียงสามารถสร้างสรรค์ได้ตามใจชอบ \n \nรวมทั้งสิ้น 20 รางวัล มูลค่ารวมทั้งสิ้น 50,000 บาท\n1.โซนพื้นที่เกษตรกรรม : จำนวน 5 รางวัล รางวัลละ 3,000 บาท\n2.โซนพื้นที่เมืองท่องเที่ยวและเมืองเศรษฐกิจ : จำนวน 5 รางวัล รางวัลละ 3,000 บาท\n3.โซนพื้นที่กลุ่มอุตสากรรมและจังหวัดชายแดน : จำนวน 5 รางวัล รางวัลละ 3,000 บาท\n4.รางวัลพิเศษไม่จำกัดโซนพื้นที่ :  จำนวน 5 รางวัล รางวัลละ 1,000 บาท\n \n* คำตัดสินและดุลยพินิจใดๆของคณะกรรมการและหรือของบริษัทฯถือเป็นเด็ดขาดและสิ้นสุดในทุกกรณี\n**เงินรางวัลหรือรายละเอียดอื่นๆอาจมีการเปลี่ยนแปลงได้ โดยไม่ต้องแจ้งให้ทราบล่วงหน้า',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).black600,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            'ตัวอย่างคลิปผลงาน',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 450.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: FutureBuilder<List<TiktokVideoRecord>>(
                              future: queryTiktokVideoRecordOnce(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                List<TiktokVideoRecord>
                                    pageViewTiktokVideoRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final pageViewTiktokVideoRecord =
                                    pageViewTiktokVideoRecordList.isNotEmpty
                                        ? pageViewTiktokVideoRecordList.first
                                        : null;
                                return Builder(
                                  builder: (context) {
                                    final tiktokList =
                                        pageViewTiktokVideoRecord!.tiktokList!
                                            .toList();
                                    return Container(
                                      width: double.infinity,
                                      height: 450.0,
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 50.0),
                                            child: PageView.builder(
                                              controller: _model
                                                      .pageViewController ??=
                                                  PageController(
                                                      initialPage: min(
                                                          0,
                                                          tiktokList.length -
                                                              1)),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: tiktokList.length,
                                              itemBuilder:
                                                  (context, tiktokListIndex) {
                                                final tiktokListItem =
                                                    tiktokList[tiktokListIndex];
                                                return FlutterFlowVideoPlayer(
                                                  path: functions
                                                      .showMatVideoInList(
                                                          pageViewTiktokVideoRecord!
                                                              .tiktokList!
                                                              .toList(),
                                                          tiktokListIndex)!,
                                                  videoType: VideoType.network,
                                                  autoPlay: false,
                                                  looping: true,
                                                  showControls: true,
                                                  allowFullScreen: true,
                                                  allowPlaybackSpeedMenu: false,
                                                );
                                              },
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: smooth_page_indicator
                                                  .SmoothPageIndicator(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: min(
                                                            0,
                                                            tiktokList.length -
                                                                1)),
                                                count: tiktokList.length,
                                                axisDirection: Axis.horizontal,
                                                onDotClicked: (i) async {
                                                  await _model
                                                      .pageViewController!
                                                      .animateToPage(
                                                    i,
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                effect: smooth_page_indicator
                                                    .ExpandingDotsEffect(
                                                  expansionFactor: 2.0,
                                                  spacing: 8.0,
                                                  radius: 16.0,
                                                  dotWidth: 16.0,
                                                  dotHeight: 16.0,
                                                  dotColor: Color(0xFF9E9E9E),
                                                  activeDotColor:
                                                      Color(0xFF3F51B5),
                                                  paintStyle:
                                                      PaintingStyle.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
