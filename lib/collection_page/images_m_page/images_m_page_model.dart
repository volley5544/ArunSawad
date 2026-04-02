import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/collection_page/appbar_follow_up_debt/appbar_follow_up_debt_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import 'images_m_page_widget.dart' show ImagesMPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ImagesMPageModel extends FlutterFlowModel<ImagesMPageWidget> {
  ///  Local state fields for this page.

  List<ImageMDataModelStruct> dataImage = [];
  void addToDataImage(ImageMDataModelStruct item) => dataImage.add(item);
  void removeFromDataImage(ImageMDataModelStruct item) =>
      dataImage.remove(item);
  void removeAtIndexFromDataImage(int index) => dataImage.removeAt(index);
  void insertAtIndexInDataImage(int index, ImageMDataModelStruct item) =>
      dataImage.insert(index, item);
  void updateDataImageAtIndex(
          int index, Function(ImageMDataModelStruct) updateFn) =>
      dataImage[index] = updateFn(dataImage[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (collectionApiImage)] action in imagesMPage widget.
  ApiCallResponse? imageOutput;
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
