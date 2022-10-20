import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PinCodeAuthenInputWidget extends StatefulWidget {
  const PinCodeAuthenInputWidget({Key? key}) : super(key: key);

  @override
  _PinCodeAuthenInputWidgetState createState() =>
      _PinCodeAuthenInputWidgetState();
}

class _PinCodeAuthenInputWidgetState extends State<PinCodeAuthenInputWidget> {
  TextEditingController? pinCodeController;

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      textStyle: FlutterFlowTheme.of(context).subtitle2.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.of(context).secondaryColor,
          ),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      enableActiveFill: false,
      autoFocus: true,
      showCursor: true,
      cursorColor: FlutterFlowTheme.of(context).primaryColor,
      obscureText: false,
      hintCharacter: '●',
      pinTheme: PinTheme(
        fieldHeight: 60,
        fieldWidth: 60,
        borderWidth: 2,
        borderRadius: BorderRadius.circular(12),
        shape: PinCodeFieldShape.box,
        activeColor: FlutterFlowTheme.of(context).secondaryColor,
        inactiveColor: FlutterFlowTheme.of(context).primaryBackground,
        selectedColor: FlutterFlowTheme.of(context).secondaryText,
        activeFillColor: FlutterFlowTheme.of(context).secondaryColor,
        inactiveFillColor: FlutterFlowTheme.of(context).primaryBackground,
        selectedFillColor: FlutterFlowTheme.of(context).secondaryText,
      ),
      controller: pinCodeController,
      onChanged: (_) => {},
    );
  }
}
