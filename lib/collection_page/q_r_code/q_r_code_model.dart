import '/collection_page/appbar_follow_up_debt/appbar_follow_up_debt_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'q_r_code_widget.dart' show QRCodeWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QRCodeModel extends FlutterFlowModel<QRCodeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appbarFollowUpDebt component.
  late AppbarFollowUpDebtModel appbarFollowUpDebtModel;

  @override
  void initState(BuildContext context) {
    appbarFollowUpDebtModel =
        createModel(context, () => AppbarFollowUpDebtModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appbarFollowUpDebtModel.dispose();
  }
}
