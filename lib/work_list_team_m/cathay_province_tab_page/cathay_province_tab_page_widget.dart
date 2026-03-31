import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cathay_province_tab_page_model.dart';
export 'cathay_province_tab_page_model.dart';

class CathayProvinceTabPageWidget extends StatefulWidget {
  const CathayProvinceTabPageWidget({
    super.key,
    this.branchCode,
    this.profileLevel,
  });

  final String? branchCode;
  final String? profileLevel;

  static String routeName = 'CathayProvinceTabPage';
  static String routePath = 'CathayProvinceTabPage';

  @override
  State<CathayProvinceTabPageWidget> createState() =>
      _CathayProvinceTabPageWidgetState();
}

class _CathayProvinceTabPageWidgetState
    extends State<CathayProvinceTabPageWidget> {
  late CathayProvinceTabPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CathayProvinceTabPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CathayProvinceTabPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
        ),
      ),
    );
  }
}
