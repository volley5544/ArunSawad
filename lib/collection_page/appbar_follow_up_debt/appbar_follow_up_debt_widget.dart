import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appbar_follow_up_debt_model.dart';
export 'appbar_follow_up_debt_model.dart';

class AppbarFollowUpDebtWidget extends StatefulWidget {
  const AppbarFollowUpDebtWidget({super.key});

  @override
  State<AppbarFollowUpDebtWidget> createState() =>
      _AppbarFollowUpDebtWidgetState();
}

class _AppbarFollowUpDebtWidgetState extends State<AppbarFollowUpDebtWidget> {
  late AppbarFollowUpDebtModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbarFollowUpDebtModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 70.0,
      decoration: BoxDecoration(
        color: Color(0xFFFF893A),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 15.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: 20.0,
                borderWidth: 2.0,
                buttonSize: 35.0,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 20.0,
                ),
                onPressed: () async {
                  FFAppState().update(() {
                    FFAppState().imgURL = [];
                    FFAppState().imgURLTemp =
                        'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
                  });
                  context.safePop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
