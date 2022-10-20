import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPageWidget extends StatefulWidget {
  const SplashPageWidget({
    Key? key,
    this.dailyText,
  }) : super(key: key);

  final String? dailyText;

  @override
  _SplashPageWidgetState createState() => _SplashPageWidgetState();
}

class _SplashPageWidgetState extends State<SplashPageWidget> {
  List<String>? checkboxGroupValues;
  PageController? pageViewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x98000000),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 330,
            height: 600,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FutureBuilder<List<SplashPageImgRecord>>(
                    future: querySplashPageImgRecordOnce(
                      queryBuilder: (splashPageImgRecord) =>
                          splashPageImgRecord.where('day',
                              isEqualTo: functions
                                  .checkDateWeekDay(getCurrentTimestamp)),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      List<SplashPageImgRecord>
                          pageViewSplashPageImgRecordList = snapshot.data!;
                      // Return an empty Container when the document does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final pageViewSplashPageImgRecord =
                          pageViewSplashPageImgRecordList.isNotEmpty
                              ? pageViewSplashPageImgRecordList.first
                              : null;
                      return Builder(
                        builder: (context) {
                          final splashPageImgList =
                              pageViewSplashPageImgRecord!.imgURL!.toList();
                          return Container(
                            width: double.infinity,
                            height: 500,
                            child: Stack(
                              children: [
                                PageView.builder(
                                  controller: pageViewController ??=
                                      PageController(
                                          initialPage: min(
                                              0, splashPageImgList.length - 1)),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: splashPageImgList.length,
                                  itemBuilder:
                                      (context, splashPageImgListIndex) {
                                    final splashPageImgListItem =
                                        splashPageImgList[
                                            splashPageImgListIndex];
                                    return Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            splashPageImgListItem,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, 0.5),
                                          child: Container(
                                            width: 280,
                                            height: 200,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                                  child: Text(
                                                    FFAppState().dailyText,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'FC Home Italic',
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: pageViewController ??=
                                          PageController(
                                              initialPage: min(
                                                  0,
                                                  splashPageImgList.length -
                                                      1)),
                                      count: splashPageImgList.length,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) {
                                        pageViewController!.animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: smooth_page_indicator.SlideEffect(
                                        spacing: 8,
                                        radius: 5,
                                        dotWidth: 12,
                                        dotHeight: 12,
                                        dotColor: Color(0xFF9E9E9E),
                                        activeDotColor: Color(0xFF3F51B5),
                                        paintStyle: PaintingStyle.fill,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: FlutterFlowCheckboxGroup(
                          options: ['ไม่แสดงอีกในวันนี้'],
                          onChanged: (val) =>
                              setState(() => checkboxGroupValues = val),
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          checkColor: Colors.white,
                          checkboxBorderColor: Color(0xFF95A1AC),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          initialized: checkboxGroupValues != null,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (checkboxGroupValues?.length == 1) {
                              setState(() => FFAppState().dateDoNotShowAgain =
                                  functions.addDoNotShowAgainDate(
                                      getCurrentTimestamp));
                            }
                            Navigator.pop(context);
                          },
                          text: 'ปิด',
                          options: FFButtonOptions(
                            width: 130,
                            height: 40,
                            color: Colors.white,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                            borderSide: BorderSide(
                              color: Color(0xFFFF8D38),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
