import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'show_checkin_image_model.dart';
export 'show_checkin_image_model.dart';

class ShowCheckinImageWidget extends StatefulWidget {
  const ShowCheckinImageWidget({
    Key? key,
    this.leaveImage,
  }) : super(key: key);

  final List<String>? leaveImage;

  @override
  _ShowCheckinImageWidgetState createState() => _ShowCheckinImageWidgetState();
}

class _ShowCheckinImageWidgetState extends State<ShowCheckinImageWidget> {
  late ShowCheckinImageModel _model;

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
    _model = createModel(context, () => ShowCheckinImageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final leaveImgNum = widget.leaveImage?.toList() ?? [];
        return Container(
          width: double.infinity,
          height: 500.0,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                child: PageView.builder(
                  controller: _model.pageViewController ??= PageController(
                      initialPage: min(0, leaveImgNum.length - 1)),
                  scrollDirection: Axis.horizontal,
                  itemCount: leaveImgNum.length,
                  itemBuilder: (context, leaveImgNumIndex) {
                    final leaveImgNumItem = leaveImgNum[leaveImgNumIndex];
                    return Stack(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: Image.network(
                                    leaveImgNumItem,
                                    fit: BoxFit.contain,
                                  ),
                                  allowRotation: false,
                                  tag: leaveImgNumItem,
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: leaveImgNumItem,
                            transitionOnUserGestures: true,
                            child: Image.network(
                              leaveImgNumItem,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: Icon(
                              Icons.cancel_outlined,
                              color: Color(0xFFFF0000),
                              size: 30.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: smooth_page_indicator.SmoothPageIndicator(
                    controller: _model.pageViewController ??= PageController(
                        initialPage: min(0, leaveImgNum.length - 1)),
                    count: leaveImgNum.length,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) async {
                      await _model.pageViewController!.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    effect: smooth_page_indicator.ExpandingDotsEffect(
                      expansionFactor: 2.0,
                      spacing: 8.0,
                      radius: 16.0,
                      dotWidth: 16.0,
                      dotHeight: 16.0,
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
  }
}
