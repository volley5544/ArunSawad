import '/backend/backend.dart';
import '/components/loading_scene_copy/loading_scene_copy_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'splash_page_model.dart';
export 'splash_page_model.dart';

class SplashPageWidget extends StatefulWidget {
  const SplashPageWidget({
    super.key,
    this.dailyText,
  });

  final String? dailyText;

  @override
  State<SplashPageWidget> createState() => _SplashPageWidgetState();
}

class _SplashPageWidgetState extends State<SplashPageWidget> {
  late SplashPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashPageModel());

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
          FutureBuilder<List<SplashPageImgRecord>>(
            future: querySplashPageImgRecordOnce(
              queryBuilder: (splashPageImgRecord) => splashPageImgRecord.where(
                'day',
                isEqualTo: functions.checkDateWeekDay(getCurrentTimestamp),
              ),
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
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                  ),
                );
              }
              List<SplashPageImgRecord> containerSplashPageImgRecordList =
                  snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final containerSplashPageImgRecord =
                  containerSplashPageImgRecordList.isNotEmpty
                      ? containerSplashPageImgRecordList.first
                      : null;
              return Container(
                width: 330.0,
                height: 600.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final splashPageImgList =
                              containerSplashPageImgRecord?.imgURL?.toList() ??
                                  [];
                          return Container(
                            width: double.infinity,
                            height: 500.0,
                            child: Stack(
                              children: [
                                PageView.builder(
                                  controller: _model.pageViewController ??=
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
                                              BorderRadius.circular(12.0),
                                          child: OctoImage(
                                            placeholderBuilder: (_) =>
                                                SizedBox.expand(
                                              child: Image(
                                                image: BlurHashImage(
                                                    containerSplashPageImgRecord!
                                                        .blurHash.first),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            image: NetworkImage(
                                              splashPageImgListItem,
                                            ),
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.5),
                                          child: Container(
                                            width: 280.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    FFAppState().dailyText,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'FC Home Italic',
                                                          fontSize: 22.0,
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
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: min(
                                                  0,
                                                  splashPageImgList.length -
                                                      1)),
                                      count: splashPageImgList.length,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: smooth_page_indicator.SlideEffect(
                                        spacing: 8.0,
                                        radius: 5.0,
                                        dotWidth: 12.0,
                                        dotHeight: 12.0,
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
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: FlutterFlowCheckboxGroup(
                              options: ['ไม่แสดงอีกในวันนี้'],
                              onChanged: (val) => setState(
                                  () => _model.checkboxGroupValues = val),
                              controller:
                                  _model.checkboxGroupValueController ??=
                                      FormFieldController<List<String>>(
                                [],
                              ),
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: Colors.white,
                              checkboxBorderColor: Color(0xFF95A1AC),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              initialized: _model.checkboxGroupValues != null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 7.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.checkboxGroupValues?.length == 1) {
                                    FFAppState().update(() {
                                      FFAppState().dateDoNotShowAgain =
                                          functions.addDoNotShowAgainDate(
                                              getCurrentTimestamp);
                                    });
                                  }
                                  Navigator.pop(context);
                                },
                                text: 'ปิด',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Color(0xFFFF8D38),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  7.0, 0.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await actions.capScene(
                                    context,
                                    functions.showMatNameInList(
                                        functions
                                            .imgPathToString(
                                                containerSplashPageImgRecord
                                                    ?.imgURL
                                                    ?.toList())
                                            .toList(),
                                        _model.pageViewCurrentIndex),
                                    FFAppState().dailyText,
                                  );
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingSceneCopyWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  await Future.delayed(
                                      const Duration(milliseconds: 6000));
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'บันทึกภาพลง Gallery เรียบร้อย'),
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
                                  Navigator.pop(context);
                                },
                                text: 'บันทึกรูป',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFFFB71A),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
