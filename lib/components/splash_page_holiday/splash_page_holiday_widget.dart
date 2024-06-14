import '/backend/backend.dart';
import '/components/loading_scene_copy/loading_scene_copy_widget.dart';
import '/components/tiktok_splash_page/tiktok_splash_page_widget.dart';
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
import 'splash_page_holiday_model.dart';
export 'splash_page_holiday_model.dart';

class SplashPageHolidayWidget extends StatefulWidget {
  const SplashPageHolidayWidget({
    super.key,
    this.dailyText,
  });

  final String? dailyText;

  @override
  State<SplashPageHolidayWidget> createState() =>
      _SplashPageHolidayWidgetState();
}

class _SplashPageHolidayWidgetState extends State<SplashPageHolidayWidget> {
  late SplashPageHolidayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashPageHolidayModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

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
          FutureBuilder<List<SplashPageHolidayImgRecord>>(
            future: querySplashPageHolidayImgRecordOnce(
              queryBuilder: (splashPageHolidayImgRecord) =>
                  splashPageHolidayImgRecord.where(
                'Date',
                isLessThanOrEqualTo: getCurrentTimestamp,
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
              List<SplashPageHolidayImgRecord>
                  containerSplashPageHolidayImgRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final containerSplashPageHolidayImgRecord =
                  containerSplashPageHolidayImgRecordList.isNotEmpty
                      ? containerSplashPageHolidayImgRecordList.first
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
                          final splashPageHolidayImgList =
                              containerSplashPageHolidayImgRecord?.holidayImg
                                      ?.toList() ??
                                  [];
                          return Container(
                            width: double.infinity,
                            height: 500.0,
                            child: Stack(
                              children: [
                                PageView.builder(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(
                                                  0,
                                                  splashPageHolidayImgList
                                                          .length -
                                                      1))),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: splashPageHolidayImgList.length,
                                  itemBuilder:
                                      (context, splashPageHolidayImgListIndex) {
                                    final splashPageHolidayImgListItem =
                                        splashPageHolidayImgList[
                                            splashPageHolidayImgListIndex];
                                    return Stack(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if ((functions.sortingBoolListByOrder(
                                                        containerSplashPageHolidayImgRecord
                                                            ?.isHaveLink
                                                            ?.toList(),
                                                        containerSplashPageHolidayImgRecord
                                                            ?.index
                                                            ?.toList())?[
                                                    splashPageHolidayImgListIndex]) ==
                                                true) {
                                              await launchURL(functions
                                                      .sortingListByOrder(
                                                          containerSplashPageHolidayImgRecord
                                                              ?.linkUrl
                                                              ?.toList(),
                                                          containerSplashPageHolidayImgRecord
                                                              ?.index
                                                              ?.toList())![
                                                  splashPageHolidayImgListIndex]);
                                            } else {
                                              if ((functions.sortingListByOrder(
                                                          containerSplashPageHolidayImgRecord
                                                              ?.linkUrl
                                                              ?.toList(),
                                                          containerSplashPageHolidayImgRecord
                                                              ?.index
                                                              ?.toList())?[
                                                      splashPageHolidayImgListIndex]) ==
                                                  'Bottom Sheet') {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          child:
                                                              TiktokSplashPageWidget(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              }
                                            }
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: OctoImage(
                                              placeholderBuilder: (_) =>
                                                  SizedBox.expand(
                                                child: Image(
                                                  image: BlurHashImage(functions
                                                          .sortingListByOrder(
                                                              containerSplashPageHolidayImgRecord
                                                                  ?.blurHash
                                                                  ?.toList(),
                                                              containerSplashPageHolidayImgRecord
                                                                  ?.index
                                                                  ?.toList())![
                                                      splashPageHolidayImgListIndex]),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              image: NetworkImage(
                                                functions.stringToImgPath(
                                                    functions.sortingListByOrder(
                                                        functions
                                                            .imgPathListToStringList(
                                                                containerSplashPageHolidayImgRecord
                                                                    ?.holidayImg
                                                                    ?.toList())
                                                            ?.toList(),
                                                        containerSplashPageHolidayImgRecord
                                                            ?.index
                                                            ?.toList())?[splashPageHolidayImgListIndex])!,
                                              ),
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.fitHeight,
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
                                              initialPage: max(
                                                  0,
                                                  min(
                                                      0,
                                                      splashPageHolidayImgList
                                                              .length -
                                                          1))),
                                      count: splashPageHolidayImgList.length,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                        setState(() {});
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
                                    letterSpacing: 0.0,
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
                                    FFAppState().DateHolidayNotShow =
                                        functions.addDoNotShowAgainDate(
                                            getCurrentTimestamp);
                                    FFAppState().update(() {});
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
                                        letterSpacing: 0.0,
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
                                  await actions.capSceneHoliday(
                                    functions.showMatNameInList(
                                        functions
                                            .sortingListByOrder(
                                                functions
                                                    .imgPathListToStringList(
                                                        containerSplashPageHolidayImgRecord
                                                            ?.holidayImg
                                                            ?.toList())
                                                    ?.toList(),
                                                containerSplashPageHolidayImgRecord
                                                    ?.index
                                                    ?.toList())
                                            ?.toList(),
                                        _model.pageViewCurrentIndex),
                                  );
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    enableDrag: false,
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
                                        letterSpacing: 0.0,
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
