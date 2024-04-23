import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/p_d_f_viewer_thaipaiboon/p_d_f_viewer_thaipaiboon_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'promotion_page_model.dart';
export 'promotion_page_model.dart';

class PromotionPageWidget extends StatefulWidget {
  const PromotionPageWidget({super.key});

  @override
  State<PromotionPageWidget> createState() => _PromotionPageWidgetState();
}

class _PromotionPageWidgetState extends State<PromotionPageWidget> {
  late PromotionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromotionPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PromotionPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));

      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'Promotion',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      ));
      _model.createdUserLogPromotion = UserLogRecord.getDocumentFromData(
          createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'Promotion',
            actionTime: getCurrentTimestamp,
            userLocation: currentUserLocationValue,
          ),
          userLogRecordReference);
      if (isAndroid) {
        await actions.allowScreenRecordAndroid();
      } else {
        await actions.allowScreenRecordIOS();
      }
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFFFF6500),
            automaticallyImplyLeading: false,
            leading: Visibility(
              visible: !FFAppState().isFromTimesheetPage,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.goNamed('SuperAppPage');
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFBFFFFFF),
                  size: 30.0,
                ),
              ),
            ),
            title: Text(
              'โปรโมชั่น',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 10.0,
          ),
          body: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 10.0, 5.0, 10.0),
                            child: FutureBuilder<List<PromotionimagesRecord>>(
                              future: queryPromotionimagesRecordOnce(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Image.asset(
                                      '',
                                    ),
                                  );
                                }
                                List<PromotionimagesRecord>
                                    gridViewPromotionimagesRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final gridViewPromotionimagesRecord =
                                    gridViewPromotionimagesRecordList.isNotEmpty
                                        ? gridViewPromotionimagesRecordList
                                            .first
                                        : null;
                                return Builder(
                                  builder: (context) {
                                    final promotionImagesList =
                                        gridViewPromotionimagesRecord?.imgUrl
                                                ?.toList() ??
                                            [];
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: promotionImagesList.length,
                                      itemBuilder:
                                          (context, promotionImagesListIndex) {
                                        final promotionImagesListItem =
                                            promotionImagesList[
                                                promotionImagesListIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (promotionImagesListIndex <= 3) {
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor: Color(0x00000000),
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            PDFViewerThaipaiboonWidget(
                                                          thaipaiboonPdfLink:
                                                              () {
                                                            if (promotionImagesListIndex ==
                                                                0) {
                                                              return 'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/ThaipaiboonPdf%2FE-Brochure-PA%E0%B8%AD%E0%B8%B8%E0%B9%88%E0%B8%99%E0%B9%83%E0%B8%88%E0%B8%AA%E0%B8%9A%E0%B8%B2%E0%B8%A2%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B9%80%E0%B8%9B%E0%B9%8B%E0%B8%B2-SSW-compressed.pdf?alt=media&token=fe9bd8d7-9ea2-4254-9aa3-4ee134802b7a';
                                                            } else if (promotionImagesListIndex ==
                                                                1) {
                                                              return 'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/ThaipaiboonPdf%2FE-Brochure-PA%E0%B8%84%E0%B8%A3%E0%B8%AD%E0%B8%9A%E0%B8%84%E0%B8%A3%E0%B8%B1%E0%B8%A7%E0%B8%AA%E0%B8%B8%E0%B8%82%E0%B9%83%E0%B8%88x2.pdf?alt=media&token=b47ad2d2-f854-490f-9164-4192df9c9b12';
                                                            } else if (promotionImagesListIndex ==
                                                                2) {
                                                              return 'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/ThaipaiboonPdf%2FE-Brochure-PA%E0%B8%9E%E0%B8%B5%E0%B9%88%E0%B8%A7%E0%B8%B4%E0%B8%A7%E0%B8%84%E0%B8%B8%E0%B9%89%E0%B8%A1%E0%B8%8A%E0%B8%B1%E0%B8%A7%E0%B8%A3%E0%B9%8C-SSW-compressed%20(1).pdf?alt=media&token=b3ab52cc-9d74-449b-98d7-3f3b510596c8';
                                                            } else {
                                                              return 'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/ThaipaiboonPdf%2F%E0%B8%A3%E0%B8%B2%E0%B8%A2%E0%B8%8A%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B9%82%E0%B8%A3%E0%B8%87%E0%B8%9E%E0%B8%A2%E0%B8%B2%E0%B8%9A%E0%B8%B2%E0%B8%A5%E0%B8%84%E0%B8%B9%E0%B9%88%E0%B8%AA%E0%B8%B1%E0%B8%8D%E0%B8%8D%E0%B8%B2_%E0%B9%84%E0%B8%97%E0%B8%A2%E0%B9%84%E0%B8%9E%E0%B8%9A%E0%B8%B9%E0%B8%A5%E0%B8%A2%E0%B9%8C%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B1%E0%B8%99%E0%B8%A0%E0%B8%B1%E0%B8%A2.pdf?alt=media&token=fb36f912-4a08-41bf-b0cc-7500f7cead99';
                                                            }
                                                          }(),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            } else {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      promotionImagesListItem,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag:
                                                        promotionImagesListItem,
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                          child: Hero(
                                            tag: promotionImagesListItem,
                                            transitionOnUserGestures: true,
                                            child: Image.network(
                                              promotionImagesListItem,
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
