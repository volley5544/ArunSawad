import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'insurance_card_copy_model.dart';
export 'insurance_card_copy_model.dart';

class InsuranceCardCopyWidget extends StatefulWidget {
  const InsuranceCardCopyWidget({Key? key}) : super(key: key);

  @override
  _InsuranceCardCopyWidgetState createState() =>
      _InsuranceCardCopyWidgetState();
}

class _InsuranceCardCopyWidgetState extends State<InsuranceCardCopyWidget> {
  late InsuranceCardCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceCardCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/ArunSawad%20Banner%20Img%2FInsurance-insights-banner.jpg?alt=media&token=887174b4-bc1b-467c-b40b-0e64c1b690a2',
            ).image,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 160.0, 0.0, 0.0),
          child: Container(
            width: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'วันที่ออกบัตร / วันหมดอายุ',
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                        Text(
                          '${dateTimeFormat(
                            'd/M/y',
                            getCurrentTimestamp,
                            locale: FFLocalizations.of(context).languageCode,
                          )}  /   ${dateTimeFormat(
                            'd/M/y',
                            getCurrentTimestamp,
                            locale: FFLocalizations.of(context).languageCode,
                          )}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF39D2C0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'จำนวนวันที่เหลือ',
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                      Text(
                        'xx วัน',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).tertiary400,
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
    );
  }
}
