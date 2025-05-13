import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import 'impound_car_price_input_component_widget.dart'
    show ImpoundCarPriceInputComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ImpoundCarPriceInputComponentModel
    extends FlutterFlowModel<ImpoundCarPriceInputComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PriceTextfield widget.
  FocusNode? priceTextfieldFocusNode;
  TextEditingController? priceTextfieldTextController;
  String? Function(BuildContext, String?)?
      priceTextfieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (updateImproundCar)] action in Button widget.
  ApiCallResponse? updatePriceApiOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    priceTextfieldFocusNode?.dispose();
    priceTextfieldTextController?.dispose();
  }
}
