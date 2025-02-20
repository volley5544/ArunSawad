import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sample_car_image_step1_model.dart';
export 'sample_car_image_step1_model.dart';

class SampleCarImageStep1Widget extends StatefulWidget {
  const SampleCarImageStep1Widget({
    super.key,
    required this.imageName,
    required this.contNoType,
    required this.numberOfImage,
    required this.carConfig,
    required this.motocycleConfig,
  });

  final String? imageName;
  final String? contNoType;
  final String? numberOfImage;
  final List<String>? carConfig;
  final List<String>? motocycleConfig;

  static String routeName = 'SampleCarImageStep1';
  static String routePath = 'sampleCarImageStep1';

  @override
  State<SampleCarImageStep1Widget> createState() =>
      _SampleCarImageStep1WidgetState();
}

class _SampleCarImageStep1WidgetState extends State<SampleCarImageStep1Widget> {
  late SampleCarImageStep1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SampleCarImageStep1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SampleCarImageStep1'});
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFFDB771A),
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: AutoSizeText(
            'ตัวอย่างภาพถ่าย${widget!.imageName}',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF003063),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget!.carConfig?.contains(widget!.contNoType) ?? true)
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        if (widget!.numberOfImage == '1')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/01.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '2')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/02_45_.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '3')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/03_45_.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '4')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/04.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '5')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/05_45_.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '6')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/06_45_.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '7')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/07.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '8')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/08.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '9')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/09_().jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '10')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/10.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '11')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/11.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '12')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/12.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                      ],
                    ),
                  ),
                if (widget!.motocycleConfig?.contains(widget!.contNoType) ??
                    true)
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        if (widget!.numberOfImage == '1')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/01M.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '2')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/02M_45_.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '3')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/03M_45_.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '4')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/04M.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '5')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/05M_45_.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '6')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/06M_45_.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '7')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/07M.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '8')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/messageImage_1737352949356.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (widget!.numberOfImage == '9')
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/09M.jpg',
                              width: 300.0,
                              height: 533.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
