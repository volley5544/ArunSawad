import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pin_code_authen_input_model.dart';
export 'pin_code_authen_input_model.dart';

class PinCodeAuthenInputWidget extends StatefulWidget {
  const PinCodeAuthenInputWidget({Key? key}) : super(key: key);

  @override
  _PinCodeAuthenInputWidgetState createState() =>
      _PinCodeAuthenInputWidgetState();
}

class _PinCodeAuthenInputWidgetState extends State<PinCodeAuthenInputWidget> {
  late PinCodeAuthenInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PinCodeAuthenInputModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return PinCodeTextField(
      autoDisposeControllers: false,
      appContext: context,
      length: 4,
      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.of(context).secondary,
          ),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      enableActiveFill: false,
      autoFocus: true,
      enablePinAutofill: true,
      errorTextSpace: 16.0,
      showCursor: true,
      cursorColor: FlutterFlowTheme.of(context).primary,
      obscureText: false,
      hintCharacter: '●',
      pinTheme: PinTheme(
        fieldHeight: 60.0,
        fieldWidth: 60.0,
        borderWidth: 2.0,
        borderRadius: BorderRadius.circular(12.0),
        shape: PinCodeFieldShape.box,
        activeColor: FlutterFlowTheme.of(context).secondary,
        inactiveColor: FlutterFlowTheme.of(context).primaryBackground,
        selectedColor: FlutterFlowTheme.of(context).secondaryText,
        activeFillColor: FlutterFlowTheme.of(context).secondary,
        inactiveFillColor: FlutterFlowTheme.of(context).primaryBackground,
        selectedFillColor: FlutterFlowTheme.of(context).secondaryText,
      ),
      controller: _model.pinCodeController,
      onChanged: (_) {},
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: _model.pinCodeControllerValidator.asValidator(context),
    );
  }
}
