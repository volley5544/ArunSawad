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
    super.key,
    this.leaveImage,
  });

  final List<String>? leaveImage;

  @override
  State<ShowCheckinImageWidget> createState() => _ShowCheckinImageWidgetState();
}

class _ShowCheckinImageWidgetState extends State<ShowCheckinImageWidget> {
  late ShowCheckinImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowCheckinImageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final leaveimagelist = widget.leaveImage?.toList() ?? [];
        return Container(
          width: double.infinity,
          height: 500.0,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                child: PageView.builder(
                  controller: _model.pageViewController ??= PageController(
                      initialPage: max(0, min(0, leaveimagelist.length - 1))),
                  scrollDirection: Axis.horizontal,
                  itemCount: leaveimagelist.length,
                  itemBuilder: (context, leaveimagelistIndex) {
                    final leaveimagelistItem =
                        leaveimagelist[leaveimagelistIndex];
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
                                    widget.leaveImage![leaveimagelistIndex],
                                    fit: BoxFit.contain,
                                  ),
                                  allowRotation: false,
                                  tag: widget.leaveImage![leaveimagelistIndex],
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: widget.leaveImage![leaveimagelistIndex],
                            transitionOnUserGestures: true,
                            child: Image.network(
                              widget.leaveImage![leaveimagelistIndex],
                              width: double.infinity,
                              height: 600.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 75.0,
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: Color(0xFFFF0000),
                            size: 35.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
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
                        initialPage: max(0, min(0, leaveimagelist.length - 1))),
                    count: leaveimagelist.length,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) async {
                      await _model.pageViewController!.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      setState(() {});
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
