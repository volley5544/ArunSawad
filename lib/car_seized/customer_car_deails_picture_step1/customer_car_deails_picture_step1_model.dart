import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'customer_car_deails_picture_step1_widget.dart'
    show CustomerCarDeailsPictureStep1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CustomerCarDeailsPictureStep1Model
    extends FlutterFlowModel<CustomerCarDeailsPictureStep1Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (searchImages)] action in customerCarDeailsPictureStep1 widget.
  ApiCallResponse? imagesAPIOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
