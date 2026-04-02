import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appbar_follow_up_debt_model.dart';
export 'appbar_follow_up_debt_model.dart';

class AppbarFollowUpDebtWidget extends StatefulWidget {
  const AppbarFollowUpDebtWidget({
    super.key,
    this.fromPage,
    String? choiceChip,
    int? state,
    this.slsTabBackAction,
  })  : this.choiceChip = choiceChip ?? 'รายชื่อลูกค้า',
        this.state = state ?? 1;

  final String? fromPage;
  final String choiceChip;
  final int state;
  final Future Function()? slsTabBackAction;

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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
                  if ((widget!.choiceChip == 'ตามที่อยู่') &&
                      ((widget!.state == 2) || (widget!.state == 3))) {
                    await widget.slsTabBackAction?.call();
                    return;
                  }
                  if (widget!.fromPage == 'OnSide') {
                    FFAppState().rp72DataList = [];
                    safeSetState(() {});
                  }
                  FFAppState().imgURL = [];
                  FFAppState().imgURLTemp =
                      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=f030a21a-d636-4c3f-a734-85bc27dd9389';
                  FFAppState().update(() {});
                  if ('${widget!.fromPage}' == 'TeamM') {
                    context.goNamed(SuperAppPageWidget.routeName);

                    return;
                  }
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
