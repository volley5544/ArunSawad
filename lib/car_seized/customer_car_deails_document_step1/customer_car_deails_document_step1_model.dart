import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/structs/index.dart';
import '/car_seized/p_d_f_viewer_from_file_path_component/p_d_f_viewer_from_file_path_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'customer_car_deails_document_step1_widget.dart'
    show CustomerCarDeailsDocumentStep1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CustomerCarDeailsDocumentStep1Model
    extends FlutterFlowModel<CustomerCarDeailsDocumentStep1Widget> {
  ///  Local state fields for this page.

  String file01Type = 'image';

  String file02Type = 'image';

  String file03Type = 'image';

  String file04Type = 'image';

  String file05Type = 'image';

  String file06Type = 'image';

  String file07Type = 'image';

  String file08Type = 'image';

  String file09Type = 'image';

  String file10Type = 'image';

  String file11Type = 'image';

  String file12Type = 'image';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? noImageAvailableFile;
  // Stores action output result for [Backend Call - API (searchImages)] action in customerCarDeailsDocumentStep1 widget.
  ApiCallResponse? imagesAPIOutput;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? image1File;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? image2File;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? image3File;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? image4File;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? image5File;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? image6File;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? image7File;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? image8File;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? image9File;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? image10File;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? image11File;
  // Stores action output result for [Custom Action - convertBase64ToFFFiles] action in customerCarDeailsDocumentStep1 widget.
  String? image12File;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
