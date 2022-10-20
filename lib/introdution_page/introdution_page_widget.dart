import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class IntrodutionPageWidget extends StatefulWidget {
  const IntrodutionPageWidget({Key? key}) : super(key: key);

  @override
  _IntrodutionPageWidgetState createState() => _IntrodutionPageWidgetState();
}

class _IntrodutionPageWidgetState extends State<IntrodutionPageWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().introPageIndex = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Image.asset(
                            'assets/images/INTRODUCTION3-Finalai-01.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitWidth,
                          ),
                          Image.asset(
                            'assets/images/INTRODUCTION3-Finalai-02.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                          Image.asset(
                            'assets/images/INTRODUCTION3-Finalai-03.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: pageViewController ??=
                                PageController(initialPage: 0),
                            count: 3,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: smooth_page_indicator.ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 0,
                              dotHeight: 0,
                              dotColor: Color(0xFF9E9E9E),
                              activeDotColor: Color(0xFFFF6B30),
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.9),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (FFAppState().introPageIndex == 1) Spacer(),
                        if (FFAppState().introPageIndex != 1)
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0, 0.9),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (FFAppState().introPageIndex <= 1) {
                                    return;
                                  }
                                  setState(() => FFAppState().introPageIndex =
                                      FFAppState().introPageIndex + -1);
                                  await pageViewController?.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
                                text: 'ย้อนกลับ',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Color(0xFFFF8D38),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, 0.9),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (FFAppState().introPageIndex != 3) {
                                  setState(() => FFAppState().introPageIndex =
                                      FFAppState().introPageIndex + 1);
                                  await pageViewController?.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                  return;
                                }
                                setState(() => FFAppState().firstUseApp = true);

                                context.goNamed('LoginPage');
                              },
                              text: functions.introPageTextButton(
                                  FFAppState().introPageIndex),
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                elevation: 2,
                                borderSide: BorderSide(
                                  color: Color(0xFFFF8D38),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
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
      ),
    );
  }
}
