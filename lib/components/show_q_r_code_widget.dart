import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowQRCodeWidget extends StatefulWidget {
  const ShowQRCodeWidget({Key? key}) : super(key: key);

  @override
  _ShowQRCodeWidgetState createState() => _ShowQRCodeWidgetState();
}

class _ShowQRCodeWidgetState extends State<ShowQRCodeWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
            child: Container(
              width: 150,
              height: 150,
              child: custom_widgets.QRCcodeWidget(
                width: 150,
                height: 150,
                qrSize: 20.0,
                qrData: FFAppState().QRCodeLink,
                gapLess: true,
                qrBackgroundColor: Colors.white,
                qrForegroundColor: FlutterFlowTheme.of(context).black600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
