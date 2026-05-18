import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/collection_page/appbar_follow_up_debt/appbar_follow_up_debt_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'sls_show_image_page_widget.dart' show SlsShowImagePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SlsShowImagePageModel extends FlutterFlowModel<SlsShowImagePageWidget> {
  ///  Local state fields for this page.

  List<SLSImagesDataModelStruct> slsImgData = [];
  void addToSlsImgData(SLSImagesDataModelStruct item) => slsImgData.add(item);
  void removeFromSlsImgData(SLSImagesDataModelStruct item) =>
      slsImgData.remove(item);
  void removeAtIndexFromSlsImgData(int index) => slsImgData.removeAt(index);
  void insertAtIndexInSlsImgData(int index, SLSImagesDataModelStruct item) =>
      slsImgData.insert(index, item);
  void updateSlsImgDataAtIndex(
          int index, Function(SLSImagesDataModelStruct) updateFn) =>
      slsImgData[index] = updateFn(slsImgData[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (collectionApiImage)] action in SlsShowImagePage widget.
  ApiCallResponse? apiResultimage;
  // Model for appbarFollowUpDebt component.
  late AppbarFollowUpDebtModel appbarFollowUpDebtModel;

  @override
  void initState(BuildContext context) {
    appbarFollowUpDebtModel =
        createModel(context, () => AppbarFollowUpDebtModel());
  }

  @override
  void dispose() {
    appbarFollowUpDebtModel.dispose();
  }
}
